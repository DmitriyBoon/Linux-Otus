# OSPF

```
- Поднять три виртуалки
- Объединить их разными vlan
1. Поднять OSPF между машинами на базе Quagga
2. Изобразить ассиметричный роутинг
3. Сделать один из линков "дорогим", но что бы при этом роутинг был симметричным
```

# sh ip ospf  database
```
       OSPF Router with ID (0.0.0.1)

                Router Link States (Area 0.0.0.0)

Link ID         ADV Router      Age  Seq#       CkSum  Link count
0.0.0.1         0.0.0.1          732 0x80000009 0xa325 2
0.0.0.2         0.0.0.2          731 0x80000008 0x3446 2
0.0.0.3         0.0.0.3          149 0x80000009 0x6010 2

                Net Link States (Area 0.0.0.0)

Link ID         ADV Router      Age  Seq#       CkSum
172.16.12.10    0.0.0.1         1442 0x80000002 0x1b6a
172.16.16.10    0.0.0.1          672 0x80000002 0xf887
172.16.20.10    0.0.0.2          471 0x80000002 0xd4a5

                Summary Link States (Area 0.0.0.0)

Link ID         ADV Router      Age  Seq#       CkSum  Route
10.0.10.0       0.0.0.1         1002 0x80000003 0xd467 10.0.10.0/24
10.0.10.0       0.0.0.2          751 0x80000003 0xce6c 10.0.10.0/24
10.0.10.0       0.0.0.3         1379 0x80000002 0xca70 10.0.10.0/24
10.0.20.0       0.0.0.2           31 0x80000002 0x62cf 10.0.20.0/24
10.0.30.0       0.0.0.3          409 0x80000003 0xeb3a 10.0.30.0/24

                Router Link States (Area 0.0.0.1)

Link ID         ADV Router      Age  Seq#       CkSum  Link count
0.0.0.1         0.0.0.1          942 0x80000005 0x0b23 1

                Summary Link States (Area 0.0.0.1)

Link ID         ADV Router      Age  Seq#       CkSum  Route
10.0.20.0       0.0.0.1          742 0x80000003 0x527b 10.0.20.0/24
10.0.30.0       0.0.0.1          912 0x80000002 0xef07 10.0.30.0/24
172.16.12.8     0.0.0.1          762 0x80000004 0xd420 172.16.12.8/30
172.16.16.8     0.0.0.1          992 0x80000003 0xbe97 172.16.16.8/30
172.16.20.8     0.0.0.1          762 0x80000003 0x8897 172.16.20.8/30

                Router Link States (Area 0.0.0.2)

Link ID         ADV Router      Age  Seq#       CkSum  Link count
0.0.0.1         0.0.0.1          992 0x80000003 0x6eef 0

                Summary Link States (Area 0.0.0.2)

Link ID         ADV Router      Age  Seq#       CkSum  Route
10.0.10.0       0.0.0.1          952 0x80000003 0xd467 10.0.10.0/24
10.0.20.0       0.0.0.1          752 0x80000003 0x527b 10.0.20.0/24
10.0.30.0       0.0.0.1          582 0x80000002 0xef07 10.0.30.0/24
172.16.12.8     0.0.0.1          762 0x80000004 0xd420 172.16.12.8/30
172.16.16.8     0.0.0.1         1012 0x80000003 0xbe97 172.16.16.8/30
172.16.20.8     0.0.0.1          792 0x80000003 0x8897 172.16.20.8/30

                Router Link States (Area 0.0.0.3)

Link ID         ADV Router      Age  Seq#       CkSum  Link count
0.0.0.1         0.0.0.1          902 0x80000003 0x6eef 0

                Summary Link States (Area 0.0.0.3)

Link ID         ADV Router      Age  Seq#       CkSum  Route
10.0.10.0       0.0.0.1          982 0x80000003 0xd467 10.0.10.0/24
10.0.20.0       0.0.0.1          762 0x80000003 0x527b 10.0.20.0/24
10.0.30.0       0.0.0.1          232 0x80000002 0xef07 10.0.30.0/24
172.16.12.8     0.0.0.1          752 0x80000004 0xd420 172.16.12.8/30
172.16.16.8     0.0.0.1          992 0x80000003 0xbe97 172.16.16.8/30
172.16.20.8     0.0.0.1          722 0x80000003 0x8897 172.16.20.8/30
```

# traceroute 10.0.20.1
```
traceroute to 10.0.20.1 (10.0.20.1), 30 hops max, 60 byte packets
 1  172.16.16.9 (172.16.16.9)  0.211 ms  0.143 ms  0.099 ms
 2  10.0.20.1 (10.0.20.1)  0.200 ms  0.164 ms  0.111 ms
```