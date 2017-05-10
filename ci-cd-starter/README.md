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

The script will prompt you for the following

* `openshift_user`: user to login into OpenShift
* `openshift_password`: password for above user
* `openshift_url`: OpenShift REST API endpoint

Advanced users might find that annoying, so feel free to add the above vars to the inventory file and then comments out the `vars_prompt` in [the playbook](ci-cd-starter-playbook.yml)

## Done
- `run.sh`
- Persistent Nexus template
- Ephemeral Jenkins with predefined plugin configuration
- Hello World pipelines for maven and npm (integrated with OCP pipelines and BlueOcean)

## WIP

- maven pod build config to publish artifacts to Nexus

## TO DO
- Dev / Test / UAT for a Java REST API
- Dev / Test / UAT for a JS/HTML web app that talks to the rest API
- Jenkins pipelines for both JAVA REST API and webapp
- Remove sample OCP pipeline from Jenkins