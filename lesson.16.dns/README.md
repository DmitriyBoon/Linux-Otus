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
 
 * Ставим policycoreutils-python

 ```
 semanage fcontext -a -e /var/named /etc/named  
 restorecon -R -v /etc/named  
 setsebool -P named_write_master_zones 1 
 
 Добавим в playbook на мастер
 
- name: selinux change rule
  shell: semanage fcontext -a -e /var/named /etc/named && restorecon -R -v /etc/named && setsebool -P named_write_master_zones 1
 ```
 
