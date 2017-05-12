# CI / CD Starter

## Introduction

This is an example to get a baseline CI / CD environment for Java dev ready

## Requirements

The following must be installed and on your `$PATH`

- `oc`
- `ansible` 2.2.0.0 or 2.2.1.0
- `git`


## Usage

``` bash
$ ./run.sh
```
### By Default...

The script will prompt you for the following variables

* `openshift_user`: user to login into OpenShift
* `openshift_password`: password for above user
* `openshift_url`: OpenShift REST API endpoint

### Advanced Users Might Prefer...

To put their credential information in an ansible vars file so they aren't prompted for it on CLI every time. Therefore; we wrote `run.sh` to detect the presence of `vars/openshift-vars.json`, `vars/openshift-vars.yaml` or `vars/openshift-vars.yml` and use those variable files instead of prompting you. These files are also `.gitignored` so you don't accidentally commit your credentials to SCM.

### If You Want To Use A Project/Namespace

You'll need to edit a [var file](vars/ci-cd-starer-vars.json). Specifically, a line that is related to a project name or namespace. You might want to do this because of collisions, or just for fun

## Access Control

1. Nexus is configured to use the default user `admin` & password `admin123`
2. Jenkins is configured to use the [OpenShift OAuth plugin](https://github.com/openshift/jenkins-openshift-login-plugin), which will inspect a users OCP `rolebindings` for the project Jenkins lives in (by default `pipelines` in this example), and then assign a user Jenkins permissions accordingly. Therefore; make sure any users accessing Jenkins have the related permissions (e.g. `edit`, `view`, `admin`) in the Jenkins OCP project.


## How to Know It's Working

You want to see that a basic Java app has been built my Jenkins and deployed the nexus. Here's how to do that.

1. Login into Jenkins. You'll see a hello world maven build. If it's already run, jump to step TODO
2. If it hasn't run yet, kick it off.
3. If the build begins to checkout source code and building the app, then jump to step 4. If the build just hangs for a minute or so, with a message like "[Pipeline] node Still waiting to schedule task Waiting for next available executor:", you need to redeploy Jenkins (via the UI by clicking on the Jenkins deployment or via CLI). What's happened here is that Jenkins was deployed before the `mvn` slave image it needs was finished building. Jenkins will automatically pick it up on reboot. Go back to step 1.
4. Wait for the build to complete successfully. If it fails, then something is wrong - open a ticket in this repo.
5. Navigate to the Nexus webpage and click on browse -> components -> labs-snapshots. You should see an entry for "automation-api." If not, something went wrong - open a ticket in this repo.

If you prefer, you can actually do the above steps by using the new Builds -> Pipelines tab in OpenShift Console as well. Be advised that "Build #1" in the Pipelines view may show build started, when in fact the build is not running because Jenkins redeployed. In this case, you'll need to kick a new build.

## Conventions in Use

- 2 BuildConfig per app. One for s2i and one for a pipeline. They should be named `foo-app` and `foo-app-pipeline`
- 3 projects in user, all prefixed with a common identifier e.g. `labs-dev`, `labs-test`, `labs-uat`
- use environment variables set by OCP and Jenkins to obtain info like tokens, namespace etc. instead of setting it yourself in pipeline script
- TODO: probably others

## Progress

### Done
- `run.sh` with smart loading of correct playbook based on variable files present
- Persistent Nexus template
- Nexus Configuration in ansible
- Ephemeral Jenkins with predefined plugin configuration
- Hello World pipelines for maven and npm (integrated with OCP pipelines and BlueOcean)
- maven pod build config to publish artifacts to Nexus
- maven build pod added to ansible stacks
- Dev / Test / UAT for a Java REST API
- Jenkins pipelines for JAVA REST API (using automation API server for now)

### WIP


### TO DO

- Dev / Test / UAT for a JS/HTML web app that talks to the rest API
- Jenkins pipeline for webapp
- Remove sample OCP pipeline from Jenkins

## Known Issues

- Jenkins deploys once immediately after instantiation, and then once as the Jenkins s2i build completes. Expected behavior is that deployment waits until s2i build populates image stream. Somehow the imagestream is being populated before. This causes pipeline build objects in OCP to start and then never complete, so "build #1" always shows "running" in the UI. Forces end user to kick builds back off in Jenkins, instead of having them automagically run.