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
 
 Добавим в playbook на ns01
 
- name: selinux change rule
  shell: semanage fcontext -a -e /var/named /etc/named && restorecon -R -v /etc/named && setsebool -P named_write_master_zones 1
 ```
 * Инструкция
   * vagrant up
   * vagrant ssh ns01
   * sudo -i
   * cd /etc/ansible/ 
   * rm -rf host && cp provisioning/hosts.txt hosts
   * ansible-playbook provisioning/playbook.yml
   * При запуске на Linux, Mac, etc. снимаем комметарий в вагранте.
   
    
 ```
 ansible-playbook provisioning/playbook.yml

PLAY [all] *********************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************
ok: [ns02]
ok: [client1]
ok: [client2]
ok: [ns01]

TASK [install packages] ********************************************************************************************************************************************************************************
changed: [client1] => (item=[u'bind', u'bind-utils', u'ntp', u'policycoreutils-python'])
changed: [ns01] => (item=[u'bind', u'bind-utils', u'ntp', u'policycoreutils-python'])
changed: [ns02] => (item=[u'bind', u'bind-utils', u'ntp', u'policycoreutils-python'])
changed: [client2] => (item=[u'bind', u'bind-utils', u'ntp', u'policycoreutils-python'])

TASK [copy transferkey to all servers and the client] **************************************************************************************************************************************************
changed: [client1]
changed: [ns02]
changed: [client2]
changed: [ns01]

PLAY [ns01] ********************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************
ok: [ns01]

TASK [copy named.conf] *********************************************************************************************************************************************************************************
changed: [ns01]

TASK [copy zones] **************************************************************************************************************************************************************************************
changed: [ns01] => (item=/etc/ansible/provisioning/named.ddns.lab)
changed: [ns01] => (item=/etc/ansible/provisioning/named.dns.lab)
changed: [ns01] => (item=/etc/ansible/provisioning/named.dns.lab.rev)
changed: [ns01] => (item=/etc/ansible/provisioning/named.newddns.lab)
changed: [ns01] => (item=/etc/ansible/provisioning/named.newddns1.lab)
changed: [ns01] => (item=/etc/ansible/provisioning/named.newdns.lab)
changed: [ns01] => (item=/etc/ansible/provisioning/named.newdns.lab.rev)
changed: [ns01] => (item=/etc/ansible/provisioning/named.newdns1.lab)
changed: [ns01] => (item=/etc/ansible/provisioning/named.newdns1.lab.rev)

TASK [copy resolv.conf to the servers] *****************************************************************************************************************************************************************
changed: [ns01]

TASK [set /etc/named permissions] **********************************************************************************************************************************************************************
changed: [ns01]

TASK [ensure named is running and enabled] *************************************************************************************************************************************************************
changed: [ns01]

TASK [selinux change rule] *****************************************************************************************************************************************************************************
changed: [ns01]

PLAY [ns02] ********************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************
ok: [ns02]

TASK [copy named.conf] *********************************************************************************************************************************************************************************
changed: [ns02]

TASK [copy resolv.conf to the servers] *****************************************************************************************************************************************************************
changed: [ns02]

TASK [set /etc/named permissions] **********************************************************************************************************************************************************************
changed: [ns02]

TASK [ensure named is running and enabled] *************************************************************************************************************************************************************
changed: [ns02]

PLAY [client1,client2] *********************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************
ok: [client2]
ok: [client1]

TASK [copy resolv.conf to the client] ******************************************************************************************************************************************************************
changed: [client1]
changed: [client2]

TASK [copy rndc conf file] *****************************************************************************************************************************************************************************
changed: [client1]
changed: [client2]

TASK [copy motd to the client] *************************************************************************************************************************************************************************
changed: [client2]
changed: [client1]

PLAY RECAP *********************************************************************************************************************************************************************************************
client1                    : ok=7    changed=5    unreachable=0    failed=0
client2                    : ok=7    changed=5    unreachable=0    failed=0
ns01                       : ok=10   changed=8    unreachable=0    failed=0
ns02                       : ok=8    changed=6    unreachable=0    failed=0
 ```
 
