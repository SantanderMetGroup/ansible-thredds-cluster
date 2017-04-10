# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

hosts = YAML.load_file('vagrant_hosts.yml')

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  hosts.each do |host|
    config.vm.define host['name'] do |node|
      node.vm.box = host['box'] 
      node.vm.box_check_update = true

      node.vm.hostname = host['name']
      node.vm.network :private_network, ip: host['ip']

      ## Uncomment these lines if you aren't in Windows
      #node.vm.provision 'ansible' do |ansible|
      #  ansible.playbook = 'provision.yml'
      #  ansible.limit = host['name']
      #  ansible.host_vars = {
      #    host['name'] => {
      #      ip_address: host['ip']
      #    }
      #  }
      #  ansible.extra_vars = {
      #    host: host['name']
      #  }
      #  ansible.groups = {
      #    "httpd" => ["hostA"],
      #    "workers" => ["hostC", "hostD"]
      #  }
      #end

      node.vm.provider :virtualbox do |vb|
        vb.name = host['name']
        vb.linked_clone = true

        if host.has_key? 'provider.memory'
          vb.memory = host['provider.memory']
        end

        if host.has_key? 'provider.cpus'
          vb.cpus = host['provider.cpus']
        end

      end
    end
  end
end