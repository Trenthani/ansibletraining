cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.29.2  client2
192.168.29.3  client1
192.168.29.4  ansible-host
EOL

[ -f ./.ssh/vagrant ] && chmod 600 ./.ssh/vagrant || echo "vagrant key not found"