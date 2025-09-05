#!/usr/bin/env bash
set -euo pipefail
apt update && apt install -y build-essential libssl-dev git
cd /opt
git clone https://github.com/wg/wrk.git
cd wrk
make
cp wrk /usr/local/bin/
echo "wrk installed" > /root/wrk_install_done.txt
sudo ip addr add 10.0.0.2/24 dev eth0
sudo ip route add default via 10.0.0.1
sudo apt install tcpdump

