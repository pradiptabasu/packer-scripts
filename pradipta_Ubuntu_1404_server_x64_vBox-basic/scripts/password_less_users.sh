#!/bin/sh

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=pradipta' /etc/sudoers
sed -i -e 's/%pradipta  ALL=(ALL:ALL) ALL/%pradipta  ALL=NOPASSWD:ALL/g' /etc/sudoers

echo '%pradipta ALL=NOPASSWD:ALL' > /etc/sudoers.d/pradipta
usermod -a -G sudo pradipta

