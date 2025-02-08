# **Vagrant NFS Server-Client Setup**

## **📌 Project Overview**
This project automates the deployment of a two-node virtualized environment using **Vagrant** and **Bash scripts**. It configures **Node1** as an NFS server and **Node2** as an NFS client, ensuring a shared directory is accessible across both nodes.

## **📁 Folder Structure**
```
Vagrant-NFS/
│-- Vagrantfile
│-- nfs_server.sh
│-- nfs_client.sh
│-- README.md
```

## **🔧 Requirements**
- **Vagrant** (Install: [Download Here](https://www.vagrantup.com/downloads))
- **VirtualBox** or another provider (e.g., Libvirt, VMware)
- **Git** (For version control, optional but recommended)

## **⚙️ Features & Automation**
✅ **Two Virtual Machines:**
   - `node1` (NFS Server)
   - `node2` (NFS Client)

✅ **Automated Provisioning:**
   - Uses Bash scripts (`nfs_server.sh` & `nfs_client.sh`) to install and configure NFS.

✅ **Persistent Shared Folder:**
   - `/mnt/nfs_share` on **Node1** is shared.
   - `/mnt/nfs_mount` on **Node2** mounts the shared directory.

## **🚀 Setup Instructions**
### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/yourusername/devops-vagrant-nfs.git
cd devops-vagrant-nfs
```

### **2️⃣ Start the Virtual Machines**
```bash
vagrant up
```
This will automatically:
- Create two VMs (`node1` & `node2`)
- Set up the NFS server on `node1`
- Mount the shared directory on `node2`

### **3️⃣ Verify the Setup**
#### **Check the shared directory from `node2`**
```bash
vagrant ssh node2
ls -l /mnt/nfs_mount
```

#### **Test file creation & synchronization**
```bash
echo "Hello NFS" | sudo tee /mnt/nfs_mount/testfile.txt
```
Now, log in to `node1` and verify the file exists:
```bash
vagrant ssh node1
ls -l /mnt/nfs_share
```
If you see `testfile.txt`, your NFS setup is working correctly! 🎉

## **🛠 Troubleshooting**
🔹 **Check NFS Service on `node1`**
```bash
sudo systemctl status nfs-kernel-server
sudo systemctl stop 
```

🔹 **Check Mounted Directory on `node2`**
```bash
mount | grep nfs
```

## **📜 License**
This project is open-source under the **MIT License**.

## **🌟 Contributing**
Feel free to fork this repository, improve the scripts, and create pull requests!

---
Made with ❤️ by [Gaurav Kumar](https://github.com/KumarGaurav-Tech)

