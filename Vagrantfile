Vagrant.configure(2) do |config|
  config.vbguest.auto_update = false
  (1..100).each do |i|
    config.vm.define "slave-" + i.to_s.rjust(3, "0") do |node|
      node.vm.box = "ubuntu/xenial64"
      node.vm.provider :virtualbox do |v|
        v.memory = 256
        v.cpus = 1
      end

      node.vm.hostname = "slave-" + i.to_s.rjust(3, "0")
      node.vm.provision "shell", path: "provision.sh"
    end
  end
end