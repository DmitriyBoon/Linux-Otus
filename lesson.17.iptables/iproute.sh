#!/bin/bash/
# Проброс tcp порта с inetRouter2 8080 на centralServer 80 
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp --dport 8080 -j DNAT --to-destination 192.168.255.3:80
iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 80 -j SNAT --to-source 192.168.255.2
iptables -A FORWARD -i eth1 -p tcp  -m conntrack --ctstate NEW -d 192.168.255.3 --dport 80  -j ACCEPT
iptables -A INPUT -p TCP -j ACCEPT
