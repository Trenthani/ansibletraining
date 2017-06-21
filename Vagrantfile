# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
	# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
	boxes = [
		{ 
			:name => "client2", 
			:box => "centos-7.3",
			:ram => 512,
			:vcpu => 1,
			:ip => "192.168.29.2" 
		},
		{ 
			:name => "client1",
			:box => "centos-7.3", 
			:ram => 512,
			:vcpu => 1,
			:ip => "192.168.29.3" 
		},
		{ 
			:name => "ansible-host",
			:box => "tower_v2.3",
			:ram => 1024,
			:vcpu => 1,
			:ip => "192.168.29.4" 
		}
	]

	# Set up the proxy username and password settings.
	# This uses whatever is set in the environment variable so you don't need to make them public here
	# PROTIP: encode special characters using percent encoding: https://en.wikipedia.org/wiki/Percent-encoding
	puts "Setting up the proxy config values..."
	# Uncomment the lines below if you want to see the passwords on screen
	if Vagrant.has_plugin?("vagrant-proxyconf")
		if ENV["http_proxy"]
			#puts "http_proxy: " + ENV["http_proxy"]
			config.proxy.http = ENV["http_proxy"]
		end
		if ENV["https_proxy"]
			#puts "https_proxy: " + ENV["https_proxy"]
			config.proxy.https = ENV["https_proxy"]
		end
		if ENV["no_proxy"]
			config.proxy.no_proxy = ENV["no_proxy"]
		else
			puts "setting no_proxy via else condition"
			config.proxy.no_proxy = "localhost,127.0.0.1"
		end
	end

	# Provision each of the VMs.
	boxes.each do |opts|
		config.vm.define opts[:name] do |config|
			# For some reason, we are disabling the synced folder:
			config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
			config.ssh.insert_key = false
			config.vm.box = opts[:box]
			config.vm.hostname = opts[:name]
			config.vm.provider :virtualbox do |v|
				v.memory = opts[:ram]
				v.cpus = opts[:vcpu]
			end
			config.vm.network :private_network, ip: opts[:ip]
        
			# Provision both VMs using Ansible after the last VM is booted.
			if opts[:name] == "ansible-host"
				#config.vm.provision :shell, path: "ansible-install.sh"
				config.vm.provision :shell, path: "host.sh"
			  
				# Transfer ssh private key used for ansible connectivity
				config.vm.provision :file do |file|
					file.source	= './keys/vagrant'
					file.destination = '/home/vagrant/.ssh/vagrant'
				end
				config.vm.provision :file do |file|
					file.source	= './keys/vagrant.pub'
					file.destination = '/home/vagrant/.ssh/vagrant.pub'
				end
				
				# Shell script to set permission of ssh private keys and copy key to client1 and 2
				config.vm.provision :shell, path: "ansibleconf.sh"
				
			end
      
			config.vm.provision :shell, path: "bootstrap-node.sh"
		end    
	end
end