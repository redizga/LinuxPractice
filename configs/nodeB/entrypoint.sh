#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward

IFACE_SERVER=$(ip route show 192.168.11.0/24 | awk '{print $3}')
IFACE_CLIENT=$(ip route show 192.168.12.0/24 | awk '{print $3}')

iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i "$IFACE_SERVER" -o "$IFACE_CLIENT" -p tcp --dport 5000 --syn -j ACCEPT
iptables -A FORWARD -i "$IFACE_CLIENT" -o "$IFACE_SERVER" -p tcp --dport 5000 --syn -j ACCEPT
iptables -P FORWARD DROP

tcpdump -i any port 5000 -n -l &
sleep infinity
