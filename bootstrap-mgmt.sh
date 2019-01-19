#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
# cp -a /vagrant/examples/* /home/vagrant
# chown -R vagrant:vagrant /home/vagrant

cp /vagrant/hosts /etc/ansible
chown root:root /etc/ansible/hosts
chmod 644 /etc/ansible/hosts

# Copy ssh private key
cp /tmp/SSHKEYS/private-key-for-ansible ~vagrant/.ssh/id_rsa
chown vagrant:vagrant ~vagrant/.ssh/id_rsa
chmod 600 ~vagrant/.ssh/id_rsa

# We want Ansible to run without errors
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config


# configure hosts file for our internal network defined by Vagrantfile
cat <<EOT>> /etc/hosts

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  lb
10.0.15.21  web1
10.0.15.22  web2

EOT
