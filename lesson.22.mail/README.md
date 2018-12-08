# Почта: SMTP, IMAP, POP3

Запускаем Vagrant 
Ждем пока отработает, сервер разворачивается из ansible роли
Руками добавляем базу в mysql 

* mysql

```
create database servermail;

CREATE TABLE `virtual_domains` (
    `id`  INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `domain_id` INT NOT NULL,
    `password` VARCHAR(106) NOT NULL,
    `email` VARCHAR(120) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`),
    FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_aliases` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `domain_id` INT NOT NULL,
    `source` varchar(100) NOT NULL,
    `destination` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

* Добавить пользователя
```
INSERT INTO `servermail`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
('1', '1', ENCRYPT('firstpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'email1@example.com'),
('2', '1', ENCRYPT('secondpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'email2@example.com');
```
* Дать права к базе пользователю 

```
mysql > GRANT SELECT ON servermail.* TO 'usermail'@'127.0.0.1' IDENTIFIED BY 'mailpassword';

Сбросьте привилегии MySQL:

mysql > FLUSH PRIVILEGES;
```

* Отправка письма

``` 
[root@mailclient ~]# telnet 192.168.255.1 25
Trying 192.168.255.1...
Connected to 192.168.255.1.
Escape character is '^]'.
220 mailserv ESMTP Postfix
helo mail
250 mailserv
MAIL FROM: root@localhost
250 2.1.0 Ok
RCPT TO: mailserv@localhost
250 2.1.5 Ok
DATA
354 End data with <CR><LF>.<CR><LF>
otus bla bla bka^?^[[3~
.
250 2.0.0 Ok: queued as 6A7B7C08E9
quit
221 2.0.0 Bye
Connection closed by foreign host.
```

* письмо
```
cat mailserv
From root@localhost  Mon Dec  3 13:44:11 2018
Return-Path: <root@localhost>
X-Original-To: mailserv@localhost
Delivered-To: mailserv@localhost
Received: from mail (unknown [192.168.255.2])
        by mailserv (Postfix) with SMTP id 0467BC08E9
        for <mailserv@localhost>; Mon,  3 Dec 2018 13:43:01 +0000 (UTC)

bla bla bla

From root@localhost  Mon Dec  3 13:45:37 2018
Return-Path: <root@localhost>
X-Original-To: mailserv@localhost
Delivered-To: mailserv@localhost
Received: from mail (unknown [192.168.255.2])
        by mailserv (Postfix) with SMTP id 6A7B7C08E9
        for <mailserv@localhost>; Mon,  3 Dec 2018 13:44:59 +0000 (UTC)

otus bla bla bk
```
