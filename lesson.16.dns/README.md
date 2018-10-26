# Lesson DNS Otus
  * zones: dns.lab, reverse dns.lab and ddns.lab 
    *  add new zone newdns.lab
  * ns01 (192.168.50.10)
    * master, recursive, allows update to ddns.lab
  * ns02 (192.168.50.11)
    * slave, recursive
  * client (192.168.50.15 and 192.168.50.16)
    * used to test the env, runs rndc and nsupdate
  * zone transfer: TSIG key
 # SELinux 
 
 
