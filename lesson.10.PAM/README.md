# 1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни

доступ с помощью SSH будни (понедельник – пятница) с 8 00 до 17 00.

добавляем pam_time.so в /etc/pam.d/sshd

```auth required /lib/security/pam_env.so
auth sufficient /lib/security/pam_unix.so likeauth nullok
auth required /lib/security/pam_deny.so
account required /lib/security/pam_unix.so
account required /lib/security/pam_time.so
account sufficient /lib/security/pam_succeed_if.so uid< 100 quiet
account required /lib/security/pam_permit.so
password requisite /lib/security/pam_cracklib.so retry=3
password sufficient /lib/security/pam_unix.so nullok use_authtok md5 shadow
password required /lib/security/pam_deny.so
session required /lib/security/pam_limits.so
session required /lib/security/pam_unix.so
```
редактируем /etc/security/time.conf

```
*;*;user1|user2|user3;Wk0800-1700
```
```
Первое поле сервисы - login, ssh, gdb
Второе поле косоли - tty, pst/X и т.д.  
Третье поле имена, группы 
Четвертое поле, время ограничения. В данный момент - понедельник - пятница (Wk) с восьми утра до пяти вечера (0800-1700).
```

# 2. Дать конкретному пользователю рута, тут несколько варинатов

Включить пользователя в sudo
```
сюда /etc/sudoers или сюда  /etc/sudoers.d/user-for-admin
так user-for-admin ALL(ALL:ALL) ALL или 
user-for-admin ALL=(ALL) NOPASSWD: ALL
```
разные опции

или добавитьв группу root
```
useradd -m -G root user
затем, нужно изменить группу в /etc/passwd
user:\x:0:0::/home/user:/bin/bash
```
или
```
cap_sys_admin user > /etc/security/capability.conf

auth     optional     pam_cap.so"  добавляем в начало /etc/pam.d/su
```
