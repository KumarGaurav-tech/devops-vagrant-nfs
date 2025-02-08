#!/bin/bash

# Install NFS Server packages
sudo apt update -y
sudo apt install -y nfs-kernel-server

# Create a directory to share
sudo mkdir -p /mnt/nfs_share
sudo chmod 777 /mnt/nfs_share

# Configure exports file
echo "/mnt/nfs_share *(rw,sync,no_root_squash,no_subtree_check)" | sudo tee -a /etc/exports

# Restart NFS services
sudo systemctl restart nfs-kernel-server
sudo exportfs -a

