#!/bin/bash
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
NAME="eth0"
IPADDR=192.168.1.$1
PREFIX=24
GATEWAY=192.168.1.2
DNS1=192.168.1.2
EOF

sed -i '/eth0/d' /etc/udev/rules.d/70-persistent-net.rules
sed -i 's/eth1/eth0/g' /etc/udev/rules.d/70-persistent-net.rules

sed -i "s/HOSTNAME=.*/HOSTNAME=hadoop$1/" /etc/sysconfig/network

reboot