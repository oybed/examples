# CI / CD Starter

This is an example to get a baseline CI / CD environment for Java dev ready

## Components ready

## WIP
- Persistent Nexus
  - OCP object list ready, just need to add this to ansible

## TO DO
- Ephemeral Jenkins (easier to patch plugins using s2i w/o persistent)
- Dev / Test / UAT for a Java REST API
- Dev / Test / UAT for a JS/HTML web app that talks to the rest API
- maven pod build config to publish artifacts to Nexus
- Jenkins pipelines for both JAVA REST API and webapp