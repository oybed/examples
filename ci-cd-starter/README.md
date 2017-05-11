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
* `nexus_url` : TODO - how do we accurately predicate this?

### Advanced Users Might Prefer...

To put their credential information in an ansible vars file so they aren't prompted for it on CLI every time. Therefore; we wrote `run.sh` to detect the presence of `vars/openshift-vars.json`, `vars/openshift-vars.yaml` or `vars/openshift-vars.yml` and use those variable files instead of prompting you. These files are also `.gitignored` so you don't accidentally commit your credentials to SCM.

## Done
- `run.sh` with smart loading of correct playbook based on variable files present
- Persistent Nexus template
- Nexus Configuration in ansible
- Ephemeral Jenkins with predefined plugin configuration
- Hello World pipelines for maven and npm (integrated with OCP pipelines and BlueOcean)
- maven pod build config to publish artifacts to Nexus

## WIP

- maven build pod added to ansible stacks

## TO DO
- Dev / Test / UAT for a Java REST API
- Dev / Test / UAT for a JS/HTML web app that talks to the rest API
- Jenkins pipelines for both JAVA REST API and webapp
- Remove sample OCP pipeline from Jenkins