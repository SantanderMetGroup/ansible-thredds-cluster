# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = [{"name" => "gateway", "forwarded_port" => "4000"},
	 {"name" => "tds1", "forwarded_port" => "4001"},
	 {"name" => "tds2", "forwarded_port" => "4002"}]

limit = []
if ARGV[0] == "up"
  if ARGV.length > 1
    limit = ARGV.drop(1)
  else
    hosts.each { |x| limit.push(x["name"]) }
  end
end

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  (0..(hosts.length - 1)).each do |n|
    host = hosts[n]
    config.vm.define host["name"] do |machine|
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      machine.vm.hostname = host["name"]
      machine.vm.box = "centos/6"
      machine.vm.network "private_network", type: "dhcp"
      machine.vm.network "forwarded_port", host: host["forwarded_port"], guest: 8080

      machine.vm.provider :virtualbox do |vb|
	vb.linked_clone = true
	vb.customize ["modifyvm", :id, "--memory", "1024"]
      end

      if n == (limit.length - 1)
	machine.vm.provision :ansible do |ansible|
	  ansible.limit = limit
	  ansible.playbook = "provision.yml"
	  ansible.groups = {
	    "gateways" => ["gateway"],
	    "tds" => ["tds1","tds2"],
	    "simple" => ["gateway", "tds1"]
	  }
	end
      end
    end
  end

  config.vm.provision "shell", inline: "useradd ansible -p ansible"
end
