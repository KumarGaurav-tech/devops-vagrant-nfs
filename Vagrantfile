
Vagrant.configure("2") do |config|
  # Define the provider
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = 1
  end

  # Node1: NFS Server
  config.vm.define "node1" do |node1|
    node1.vm.box = "ubuntu/jammy64"  # Use any preferred box
    node1.vm.hostname = "node1"
    node1.vm.network "private_network", ip: "" ## use ip:" " or type=dhcp its upto you
    node1.vm.provision "shell", path: "nfs_server.sh"
  end

  # Node2: NFS Client
  config.vm.define "node2" do |node2|
    node2.vm.box = "ubuntu/jammy64"
    node2.vm.hostname = "node2"
    node2.vm.network "private_network" , ip: "" ## use ip:" " or type=dhcp its upto you
    node2.vm.provision "shell" , path: "nfs_client.sh"
  end
end

