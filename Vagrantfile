Vagrant.configure(2) do |config|
  (1..100).each do |i|
    config.vm.define "slave-" + i.to_s.rjust(3, "0") do |node|
      node.vm.box = "generic/ubuntu1604"
      node.vm.provider :virtualbox do |vb, override|
        vb.memory = 128
        vb.cpus = 1
        config.vbguest.auto_update = false
      end
      node.vm.provider :libvirt do |libvirt, override|
        libvirt.memory = 128
        libvirt.cpus = 1
        libvirt.uri = 'qemu+unix:///system'
        libvirt.driver = 'kvm'
        node.vm.synced_folder './', '/vagrant', type: '9p'
      end
      node.vm.hostname = "slave-" + i.to_s.rjust(3, "0")
      node.vm.provision "shell", path: "provision.sh"
    end
  end
end
