Vagrant.configure(2) do |config|
  (1..100).each do |i|
    config.vm.define "slave-" + i.to_s.rjust(3, "0") do |node|
      node.vm.box = "generic/ubuntu1604"
      node.vm.provider :virtualbox do |v|
        v.memory = 128
        v.cpus = 1
      end
      node.vm.provider :libvirt do |libvirt|
        libvirt.memory = 128
        libvirt.cpus = 1
        libvirt.uri = 'qemu+unix:///system'
        libvirt.driver = 'kvm'
      end
      node.vm.synced_folder './', '/vagrant', type: '9p'
      node.vm.hostname = "slave-" + i.to_s.rjust(3, "0")
      node.vm.provision "shell", path: "provision.sh"
    end
  end
end
