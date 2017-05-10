FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7:latest
USER root
RUN scl enable rh-maven33
ADD settings.xml /usr/share/maven/conf/settings.xml