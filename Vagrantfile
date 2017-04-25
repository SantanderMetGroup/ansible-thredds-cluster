# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

#load host configuration from YAML file
require 'yaml'
hosts = YAML.load_file('vagrant_hosts.yml')

# VirtualBox base group for all host created on this provision
PROJECT_NAME = File.basename(Dir.getwd)

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  hosts.each do |host|
    config.vm.define host['name'] do |node|

      node.vm.box = host['box'] 
      node.vm.box_check_update = true
      node.vm.hostname = host['name']
      node.vm.network :private_network, ip: host['ip']

      # inserting a ssh pubkey user's defined into authorized_keys
      if host.has_key?("provision") && host["provision"].has_key?("pubkey")

        node.vm.provision "file", source: host["provision"]["pubkey"], destination: "~/.ssh/client.pub"
        node.vm.provision "shell", privileged: false, inline: "cat ~/.ssh/client.pub >>  ~/.ssh/authorized_keys"

      end

      node.vm.provider :virtualbox do |vb|

        vb.name = host['name'] + "-" + PROJECT_NAME
        vb.customize ['modifyvm', :id, '--groups', '/'+PROJECT_NAME]
        vb.linked_clone = true

        if host.has_key?("provision")
          if host["provision"].has_key?("memory")
            vb.memory = host["provision"]["memory"]
          end
          if host["provision"].has_key?("cpus")
            vb.cpus = host["provision"]["cpus"]
          end
        end
      end
    end
  end
end