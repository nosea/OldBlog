---
layout: post
title: "在ubuntu上安装kvm"
date: 2012-12-26 16:05
comments: true
categories: Ubuntu
toc: true
---
# Install Necessary Packages
``` bash
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
```
<!-- more -->
# Add Users to Groups
``` bash
sudo adduser `id -un` libvirtd
```
# Verify Installation
``` bash
virsh -c qemu:///system list
```
# Install virt-manager (graphical user interface)
``` bash
sudo apt-get install virt-manager
```
# Creating virtual machines
``` bash
#!/bin/bash 
set -x
sudo virt-install \
     --connect qemu:///system \
     --name ubuntu \
     --ram 1024 \
     --disk path=/var/lib/libvirt/images/ubuntu.img,size=15 \
     --network network:default \
     --cdrom=/path-to-iso-file/ubuntu-12.04-desktop-i386.iso \
     --os-variant=ubuntuprecise \
     --accelerate
```
# Cloning a virtual machine
``` bash
virt-clone -o ubuntu -n backup -f /var/lib/libvirt/images/backup.img --connect=qemu:///system
```
# Error log
    Starting install...
    Allocating 'ubuntu.img'                                        |  15 GB     00:00
    Creating domain...                                             |    0 B     00:02
    WARNING  Unable to connect to graphical console: virt-viewer not installed. Please
	install the 'virt-viewer' package.Domain installation still in progress. You can 
	reconnect to the console to complete the installation process.
    
	solution: sudo virt-manager运行manager，然后在manager里就可以看到.


# Reference:    
[Ubuntu Official Documentation](https://help.ubuntu.com/community/KVM/)    
[virt-install 使用说明](http://blog.csdn.net/starshine/article/details/6998189)    
[Ubuntu下的虚拟化KVM](http://blog.csdn.net/lqhbupt/article/details/7945075)
