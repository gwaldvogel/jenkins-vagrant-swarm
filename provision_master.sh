#!/bin/sh

sudo apt-get update
sudo apt-get install apt-cacher-ng -y
sudo cp /vagrant/deploy/00proxy /etc/apt/apt.conf.d/00proxy
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install openjdk-8-jre-headless -y
sudo apt-get install jenkins -y
sudo apt-get upgrade -y