#set access rights to read only for vagrant vagrant
#chmod 400 ./.ssh/id_rsa
chmod 400 ./.ssh/vagrant

# #setup authorized keys for client 1 and 2
# sshpass -f ~/.ssh/phrase.txt ssh-copy-id -i ~/.ssh/vagrant vagrant@client1
# sshpass -f ~/.ssh/phrase.txt ssh-copy-id -i ~/.ssh/vagrant vagrant@client2

# # remove password file from keys directory
# rm ~/.ssh/phrase.txt -rf

