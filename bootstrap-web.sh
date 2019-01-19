#!/usr/bin/env bash

# Copy ssh public key
mv /tmp/SSHKEYS/public-key-for-ansible ~vagrant/.ssh/authorized_keys
chown vagrant:vagrant ~vagrant/.ssh/authorized_keys
chmod 600 ~vagrant/.ssh/authorized_keys
rmdir /tmp/SSHKEYS
