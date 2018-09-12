# 1. запрет доступа пользователей на основе даты и времени

Во многих случаях будет полезно ограничить некоторым группам пользователей доступ к системе по определенным дням недели или в определенное время суток. Следующий пример призван показать, как запретить удаленный доступ для, например, подрядчиков. Они получат доступ к серверу с помощью SSH строго по будним дням (понедельник – пятница) с 8 00 до 17 00.
Для установки ограничений на любые логины по признаку даты и времени дополните /etc/pam.d/sshd модулем pam_time. Это делается так:
auth required /lib/security/pam_env.so
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

Кроме этого, добавьте к файлу /etc/security/time.conf строку
*;*;contractor1|contractor2|contractor3;Wk0800-1700

Первое поле определяет сервис (login, su и т.д.). Второе поле задает tty. Третье – перечисляет имена всех пользователей, чьи права на доступ должны быть ограничены. Последнее поле определяет временной промежуток: понедельник - пятница (Wk) с восьми утра до пяти вечера (0800-1700). Других пользователей данное ограничение не коснется. Постарайтесь не запретить по ошибке доступ руту!


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
