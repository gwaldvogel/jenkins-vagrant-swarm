FROM ubuntu:16.04
MAINTAINER Gregor Waldvogel <info@gwaldvogel.de>

# Setup python and java and base system
ENV DEBIAN_FRONTEND noninteractive
ENV LANG=en_US.UTF-8

ADD deploy/00proxy /etc/apt/apt.conf.d/00proxy

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -q -y supervisor openjdk-8-jre-headless python3 wget

ADD deploy/supervisord.conf /etc/supervisor/supervisord.conf
ADD deploy /vagrant
ADD deploy/jenkins-swarm.conf /etc/supervisor/conf.d/jenkins-swarm.conf

RUN service supervisor stop