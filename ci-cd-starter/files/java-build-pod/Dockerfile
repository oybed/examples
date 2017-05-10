FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7:latest
USER root
RUN yum install scl-utils scl-utils-build -y && yum install rh-maven33 -y
ADD settings.xml /usr/share/maven/conf/settings.xml