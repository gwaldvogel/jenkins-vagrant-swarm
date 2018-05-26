Vagrant.configure(2) do |config|
  config.vbguest.auto_update = false
  (1..10).each do |i|
    config.vm.define "slave-#{i}" do |node|
      node.vm.box = "ubuntu/xenial64"
      node.vm.provider :virtualbox do |v|
        v.memory = 256
        v.cpus = 1
      end

      node.vm.hostname = "slave-#{i}"
      node.vm.provision "shell", path: "provision.sh"
    end
  end
end