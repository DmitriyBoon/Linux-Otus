# 1. 


# 2. Дать конкретному пользователю рута, тут несколько варинатов
Включить пользователя в sudo
сюда /etc/sudoers или сюда  /etc/sudoers.d/user-for-admin
так user-for-admin ALL(ALL:ALL) ALL или 
user-for-admin ALL=(ALL) NOPASSWD: ALL
разные опции

или добавитьв групп root

useradd -m -G root user
затем, нужно изменить группу в /etc/passwd
user:\x:0:0::/home/user:/bin/bash
