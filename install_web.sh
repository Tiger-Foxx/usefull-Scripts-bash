#!/usr/bin/env bash
set -euo pipefail
apt update && apt install -y nginx
echo "<h1>Test Server $(hostname)</h1>" > /var/www/html/index.html
systemctl restart nginx
echo "Web install done" > /root/web_install_done.txt
sudo ip addr add 10.0.2.2/24 dev eth0
sudo ip route add default via 10.0.2.1
sudo apt install tcpdump
