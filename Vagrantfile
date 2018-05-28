Vagrant.configure(2) do |config|
  # config.vbguest.auto_update = false
  # config.vm.define "master" do |node|
  #   node.vm.box = "ubuntu/xenial64"
  #   node.vm.provider :virtualbox do |vb|
  #     vb.memory = 4096
  #     vb.cpus = 4
  #   end
  #   node.vm.hostname = "jenkins-master"
  #   node.vm.network "private_network", ip: "10.10.10.2"
  #   node.vm.network "public_network", ip: "10.10.11.37"
  #   node.vm.provision "shell", path: "provision_master.sh"
  #   node.vm.synced_folder ".", "/vagrant"
  #   node.vm.provider "virtualbox"
  # end
  (1..100).each do |i|
    config.vm.define "slave-" + i.to_s.rjust(3, "0") do |node|
      # node.vm.box = "ubuntu/xenial64"
      # node.vm.provider :virtualbox do |vb|
      #   vb.memory = 256
      #   vb.cpus = 1
      # end
      node.vm.provider "docker" do |d|
        d.build_dir = "."
        d.cmd = ["/usr/bin/supervisord"]
      end
      node.vm.hostname = "slave-" + i.to_s.rjust(3, "0")
      node.vm.synced_folder ".", "/vagrant"
      node.vm.provider "docker"
    end
  end
end
