# jenkins-vagrant-swarm
This project can be used to test a small jenkins setup including a master and 10 build slaves.
The master will be also set up as an apt proxy to improve provisioning time.

There are some sample testing scripts in the buildScripts folder.

## Requirements

- [vagrant](https://www.vagrantup.com/)
- [vagrant-vbguest plugin](https://github.com/dotless-de/vagrant-vbguest)
