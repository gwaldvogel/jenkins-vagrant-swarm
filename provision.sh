#!/bin/sh

sudo cp /vagrant/deploy/00proxy /etc/apt/apt.conf.d/00proxy
sudo apt-get update
sudo apt-get install supervisor openjdk-8-jre-headless -y
sudo cp /vagrant/deploy/jenkins-swarm.conf /etc/supervisor/conf.d/jenkins-swarm.conf
sudo apt-get upgrade -y
sudo service supervisor restart