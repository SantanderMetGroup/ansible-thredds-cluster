require 'yaml'
hosts = YAML.load_file('vagrant_hosts.yml')
VAGRANTFILE_API_VERSION = "2"
PROJECT_NAME = File.basename(Dir.getwd)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  hosts.each do |host|
    config.vm.define host['name'] do |node|
      node.vm.box = host['box'] 
      node.vm.box_check_update = true
      node.vm.hostname = host['name']
      node.vm.network :private_network, ip: host['ip']
      if host.has_key?("provider") && host["provider"].has_key?("pubkey")
        node.vm.provision "file", source: host["provider"]["pubkey"], destination: "~/.ssh/client.pub"
        node.vm.provision "shell", privileged: false, inline: "cat ~/.ssh/client.pub >>  ~/.ssh/authorized_keys"
      end
      node.vm.provider :virtualbox do |vb|
        vb.name = host['name'] + "-" + PROJECT_NAME
        vb.customize ['modifyvm', :id, '--groups', '/'+PROJECT_NAME]
        vb.linked_clone = true
        if host.has_key?("provider")
          if host["provider"].has_key?("memory")
            vb.memory = host["provider"]["memory"]
          end
          if host["provider"].has_key?("cpus")
            vb.cpus = host["provider"]["cpus"]
          end
        end

      end
    end
  end
end