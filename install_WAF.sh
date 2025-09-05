sudo ip addr add 10.0.1.2/24 dev eth0  # lien vers Suricata
sudo ip addr add 10.0.2.1/24 dev eth1  # lien vers Webserver
sudo ip link set eth0 up; sudo ip link set eth1 up
# config route par défaut pour reachability:
sudo ip route add default via 10.0.1.1
sudo apt install tcpdump
