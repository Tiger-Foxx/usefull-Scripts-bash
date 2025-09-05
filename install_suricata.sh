#!/usr/bin/env bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

# update
apt update && apt upgrade -y

# prerequisites for Suricata (PPA)
apt install -y software-properties-common curl jq
add-apt-repository ppa:oisf/suricata-stable -y
apt update
apt install -y suricata iptables-persistent

# enable ipv4 forwarding
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf || echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# add iptables rule to send FORWARD tcp:80 to NFQUEUE 0
iptables -I FORWARD -p tcp --dport 80 -j NFQUEUE --queue-num 0
netfilter-persistent save

echo "Suricata install done" > /root/suricata_install_done.txt
sudo ip addr add 10.0.0.1/24 dev eth0        # vers Injector
sudo ip addr add 10.0.1.1/24 dev eth1        # vers WAF

sudo ip link set eth0 up
sudo ip link set eth1 up
