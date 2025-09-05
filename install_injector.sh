#!/usr/bin/env bash
set -euo pipefail
apt update && apt install -y build-essential libssl-dev git
cd /opt
git clone https://github.com/wg/wrk.git
cd wrk
make
cp wrk /usr/local/bin/
echo "wrk installed" > /root/wrk_install_done.txt
