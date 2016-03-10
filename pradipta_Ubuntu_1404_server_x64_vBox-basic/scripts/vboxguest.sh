#!/bin/sh

if type apt-get >/dev/null 2>&1; then
	sudo apt-get update
	sudo apt-get -y upgrade
	sudo apt-get -y install linux-headers-`uname -r` dkms build-essential openssh-server
    sudo apt-get clean
fi

if type yum >/dev/null 2>&1; then
    yum clean all
fi

sudo -i

deviceName=$(echo `sudo blkid` | grep : | egrep -o '^[^:]+')
sudo mkdir /tmp/virtualbox
sudo mount $deviceName /tmp/virtualbox
sudo sh /tmp/virtualbox/VBoxLinuxAdditions.run
sudo umount /tmp/virtualbox
sudo rmdir /tmp/virtualbox

if type apt-get >/dev/null 2>&1; then
   sudo apt-get clean
fi



