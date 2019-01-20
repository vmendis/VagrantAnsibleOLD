#!/usr/bin/env bash

# Copy ssh public key
cat /tmp/SSHKEYS/public-key-for-ansible >>  ~vagrant/.ssh/authorized_keys
chown vagrant:vagrant ~vagrant/.ssh/authorized_keys
chmod 600 ~vagrant/.ssh/authorized_keys
rm /tmp/SSHKEYS/public-key-for-ansible
rmdir /tmp/SSHKEYS
