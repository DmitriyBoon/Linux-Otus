# 1. 


# 2. Дать конкретному пользователю рута, тут несколько варинатов
Включить пользователя в sudo
сюда /etc/sudoers или сюда  /etc/sudoers.d/user-for-admin
так user-for-admin ALL(ALL:ALL) ALL или 
user-for-admin ALL=(ALL) NOPASSWD: ALL
разные опции

или добавитьв группу root

useradd -m -G root user
затем, нужно изменить группу в /etc/passwd
user:\x:0:0::/home/user:/bin/bash

или

cap_sys_admin user > /etc/security/capability.conf

auth     optional     pam_cap.so"  добавляем в начало /etc/pam.d/su
