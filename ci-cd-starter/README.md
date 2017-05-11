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

### If You Want To Use A Project/Namespace Other Than `pipelines`

You'll need to edit a [var file](vars/ci-cd-starer-vars.json). Specifically, line values in `8` and `36` to indicate the project name you want to use. TODO - find a way to automate this.

## How to Know It's Working

You want to see that a basic Java app has been built my Jenkins and deployed the nexus. Here's how to do that.

1. Login into Jenkins. You'll see a hello world maven build. If it's already run, jump to step TODO
2. If it hasn't run yet, kick it off.
3. If the build begins to checkout source code and building the app, then jump to step 4. If the build just hangs for a minute or so, with a message like "[Pipeline] node Still waiting to schedule task Waiting for next available executor:", you need to redeploy Jenkins (via the UI by clicking on the Jenkins deployment or via CLI). What's happened here is that Jenkins was deployed before the `mvn` slave image it needs was finished building. Jenkins will automatically pick it up on reboot. Go back to step 1.
4. Wait for the build to complete successfully. If it fails, then something is wrong - open a ticket in this repo.
5. Navigate to the Nexus webpage and click on browse -> components -> labs-snapshots. You should see an entry for "automation-api." If not, something went wrong - open a ticket in this repo.

## Done
- `run.sh` with smart loading of correct playbook based on variable files present
- Persistent Nexus template
- Nexus Configuration in ansible
- Ephemeral Jenkins with predefined plugin configuration
- Hello World pipelines for maven and npm (integrated with OCP pipelines and BlueOcean)
- maven pod build config to publish artifacts to Nexus
- maven build pod added to ansible stacks

## WIP

- Dev / Test / UAT for a Java REST API
- Jenkins pipelines for both JAVA REST API

## TO DO

- Dev / Test / UAT for a JS/HTML web app that talks to the rest API
- Jenkins pipelines webapp
- Remove sample OCP pipeline from Jenkins