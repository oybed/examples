FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7:latest
USER root
RUN yum install rh-maven33 && scl enable rh-maven33 bash
ADD settings.xml /usr/share/maven/conf/settings.xml