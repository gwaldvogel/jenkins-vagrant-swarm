# jenkins-vagrant-swarm
This project can be used to test a small jenkins setup including a master and 10 build slaves.
The master will be also set up as an apt proxy to improve provisioning time.

There are some sample testing scripts in the buildScripts folder.

**This is not plug and play, you will have to configure most of the Jenkins things yourself!**

## Requirements

- [vagrant](https://www.vagrantup.com/)
- [vagrant-vbguest plugin](https://github.com/dotless-de/vagrant-vbguest)
- [Jenkins swarm plugin](https://plugins.jenkins.io/swarm) (must be manually installed after jenkins is up)
- Configured ci-slave jenkins user (password: ci2013)

## Network config
Jenkins master will be available at [http://10.10.10.2:8080](http://10.10.10.2:8080).
Every slave will be available at 10.10.10.(Node # + 2) (e.g. 10.10.10.3 for slave-001).
