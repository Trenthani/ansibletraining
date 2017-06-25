# Ansible training

Multi-Machine Vagrant Environments:
This Vagrantfile will create 3 Centos VM's to simulate Ansible control machine and 2 target hosts. 

* client1 - No GUI
* client2 - No GUI
* ansible-host - No GUI


## Requirements:

Internet connection is a must!

 * Vagrant 
 * Vagrant plugins - vagrant-proxyconf - needed if you are running behind proxy

* Virtualbox: latest

## Scripts included to this repository are the following:
- bootstrap-node.sh - this file enables Centos repository (of my choice: EPEL and ELREPO). Add /etc/hosts file entry
- ansibleconf.sh - this file sets permissions for the vagrant ssh private key

## Connecting the dots:
Before you run vagrant up, make sure that you updated the Vagrantfile to your desired configuration. Specifically use the box that are available from https://atlas.hashicorp.com/boxes/. The entry on the current vagrant file are custom boxes and is not available from atlas.

Once you are done: 
- _vagrant up_
  Wait for about 6 minutes to finish the build. Once done. You can try to ssh to your ansible-host vm. You can verify this by using "_vagrant status_"

- _vagrant ssh ansible-host_ 
  once you are login to your ansible-host vm, you can now verify if the other vm are reachable. The command to use is: "_ansible-playbook -i inventory playbook/ping.yml_"

## Ansible Testing

## Keys directory
Contains the private and public key used to authenticate to the targets over ssh.  Vagrant box trenthani/at-centos has the public key added to the authorizedkeys for the Vagrant users.

## Seed directory
Contains the basic structure required for an ansible project.  
 - inventories/
 - playbooks/
 - roles/
 - ansibile.cfg

 ## Note .gitignore
 To avoid unintentional loading of directories and files to your git repository be sure to configure your inclusions and exclusions via .gitignore.





