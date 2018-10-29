# Otus netfilter


* Knock port log 
```
cat /var/log/knockd.log
[2018-10-29 15:17] starting up, listening on eth0
[2018-10-29 15:22] waiting for child processes...
[2018-10-29 15:22] shutting down
[2018-10-29 15:22] starting up, listening on eth1
[2018-10-29 15:22] 192.168.255.2: closeSSH: Stage 1
[2018-10-29 15:22] 192.168.255.2: closeSSH: Stage 2
[2018-10-29 15:22] 192.168.255.2: closeSSH: Stage 3
[2018-10-29 15:22] 192.168.255.2: closeSSH: OPEN SESAME
[2018-10-29 15:22] closeSSH: running command: /sbin/iptables -D INPUT -s 192.168.255.1 -p tcp --dport 22 -j
ACCEPT

[2018-10-29 15:22] closeSSH: command returned non-zero status code (1)
[2018-10-29 15:23] 192.168.255.2: openSSH: Stage 1
[2018-10-29 15:23] 192.168.255.2: openSSH: Stage 2
[2018-10-29 15:23] 192.168.255.2: openSSH: Stage 3
[2018-10-29 15:23] 192.168.255.2: openSSH: OPEN SESAME
[2018-10-29 15:23] openSSH: running command: /sbin/iptables -I INPUT -s 192.168.255.1 -p tcp --dport 22 -j ACCEPT
```