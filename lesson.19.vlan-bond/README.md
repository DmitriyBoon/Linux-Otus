# строим бонды и вланы

# Дано
```
в Office1 в тестовой подсети появляется сервера с доп интерфесами и адресами
в internal сети testLAN
- testClient1 - 10.10.10.254
- testClient2 - 10.10.10.254
- testServer1- 10.10.10.1 
- testServer2- 10.10.10.1

равести вланами
testClient1 <-> testServer1
testClient2 <-> testServer2

между centralRouter и inetRouter
"пробросить" 2 линка (общая inernal сеть) и объединить их в бонд 
проверить работу c отключением интерфейсов
```

* Запускаем Vagrant

```
bond0: flags=5187<UP,BROADCAST,RUNNING,MASTER,MULTICAST>  mtu 1500
        inet 192.168.255.1  netmask 255.255.255.252  broadcast 192.168.255.3
        inet6 fe80::a00:27ff:fe29:f8c0  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:29:f8:c0  txqueuelen 1000  (Ethernet)
        RX packets 303  bytes 35810 (34.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 224  bytes 19214 (18.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::5054:ff:fec0:42d5  prefixlen 64  scopeid 0x20<link>
        ether 52:54:00:c0:42:d5  txqueuelen 1000  (Ethernet)
        RX packets 14193  bytes 14035394 (13.3 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4886  bytes 367257 (358.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth1: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
        ether 08:00:27:29:f8:c0  txqueuelen 1000  (Ethernet)
        RX packets 263  bytes 28052 (27.3 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 235  bytes 20864 (20.3 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth2: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
        ether 08:00:27:5a:09:bf  txqueuelen 1000  (Ethernet)
        RX packets 45  bytes 9468 (9.2 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 10  bytes 1308 (1.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
```
ifconfig |grep -i -E '(slave|master)'
bond0: flags=5187<UP,BROADCAST,RUNNING,MASTER,MULTICAST>  mtu 1500
eth1: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
eth2: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
```
* Запускаем ansible