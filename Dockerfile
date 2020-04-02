FROM jenkins/jnlp-slave:3.27-1
USER root
RUN yum install maven -y
USER jenkins
