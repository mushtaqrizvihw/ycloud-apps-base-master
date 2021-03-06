FROM centos:7

RUN yum install wget -y \
    && yum install iproute -y \
    && yum install -y which \
    && yum install -y java-1.8.0-openjdk-devel \
    && yum install -y telnet bind-tools net-tools; yum clean all

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk

# Install HDP 2.5.0.0 repo. TODO: Parametrize version
RUN wget -nv http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.5.0.0-1245/hdp.repo \
    && mv hdp.repo /etc/yum.repos.d/ \
    && yum updateinfo; yum clean all
