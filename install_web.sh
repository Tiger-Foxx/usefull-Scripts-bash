#!/usr/bin/env bash
set -euo pipefail
apt update && apt install -y nginx
echo "<h1>Test Server $(hostname)</h1>" > /var/www/html/index.html
systemctl restart nginx
echo "Web install done" > /root/web_install_done.txt
