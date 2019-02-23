module Vms
  def self.docker(config, def_name)
    current_settings = settings[def_name]
    config.vm.define def_name do |node|
      node.vm.provider :libvirt do |libvirt|
        #libvirt.id_ssh_key_file = "/home/alexey/.vagrant.d/insecure_private_key"
      end

      node.vm.hostname = current_settings[:hostname]
      node.vm.box      = current_settings[:box_name]#"ubuntu-17.10-server-amd64-libvirt" #"ubuntu-18.04-server-amd64-libvirt" # local box
       
      #node.vm.synced_folder "./mongodb", "/vagrant", type: "nfs"
      current_settings[:synced_folder]&.each{|sett| node.vm.synced_folder *sett}
      node.nfs.map_uid = 1000
      node.nfs.map_gid = 1000
      
      network(node, current_settings)
      #current_settings[:network]&.each{|sett| node.vm.network *sett}

      # Shell
      node.vm.provision :shell, path: "scripts/docker.sh", args: ["18.06.0~ce~3-0~ubuntu"], privileged: true
      node.vm.provision :shell, path: "scripts/docker_compose.sh", args: ["1.22.0"], privileged: true
    end
    config
  end 
end
