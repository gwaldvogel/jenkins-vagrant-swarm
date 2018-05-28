#!/usr/bin/env bash

# MAC_ADDRESS=`cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address`
NAME=$(hostname)


declare -a potentialLabels=("php7.0" "php7.1" "composer" "clang-3.7" "clang-3.8" "clang-3.9" "clang-4.0" "python2.7" "python3")

LABELS="-labels linux"

for label in "${potentialLabels[@]}"
do
	if [ `command -v "$label"` ]; then
		LABELS="$LABELS -labels $label"
	fi
done

# from https://stackoverflow.com/a/21470413
# kill all running swarm clients
if [ $LINUX ]; then
	for pid in `ps -ef | grep 'java -jar /jenkins/swarm-client.jar' | awk '{print $2}'` ; do sudo kill -9 $pid ; done
fi

# wait to let the swarm plugin delete the just killed swarm nodes
sleep 10
CLIENT=/vagrant/deploy/swarm-client.jar
FSROOT="-fsroot /jenkins"

sudo mkdir -p /jenkins
sudo chown -R vagrant:vagrant /jenkins

java -jar $CLIENT -name $NAME -disableClientsUniqueId -executors 1 -username ci-slave -password 'ci2013' -master "http://10.10.11.37:8080" $FSROOT $LABELS