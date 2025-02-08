#!/bin/bash

# Install NFS Client packages
sudo apt update -y
sudo apt install -y nfs-common

# Create mount point
sudo mkdir -p /mnt/nfs_mount

# Mount the NFS share
sudo mount -t nfs node1:/mnt/nfs_share /mnt/nfs_mount

# Persist the mount across reboots
echo "node1:/mnt/nfs_share /mnt/nfs_mount nfs defaults 0 0" | sudo tee -a /etc/fstab

mount -a
