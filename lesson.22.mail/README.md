# Почта: SMTP, IMAP, POP3

Запускаем Vagrant 
Ждем пока отработает, сервер разворачивается из ansible роли

* mysql
- Пользователь и база добавляются ролью

* Добавляем виртуальные домены

```
INSERT INTO `servermail`.`virtual_domains`
(`id` ,`name`)
VALUES
('3', 'test.otus'),
('4', 'servermail.loc');
```

Добавляем ящики
```
INSERT INTO `servermail`.`virtual_users` 
(`id`, `domain_id`, `password` , `email`) 
VALUES
('1', '3', ENCRYPT('firstpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'usermail@test.otus'),
('2', '4', ENCRYPT('secondpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'usermail@servermail.loc');
```


* Отправка письма

```[root@mailclient ~]# telnet 192.168.255.1 25
Trying 192.168.255.1...
Connected to 192.168.255.1.
Escape character is '^]'.
220 mailserv ESMTP Postfix
ehlo mail
250-mailserv
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-STARTTLS
250-ENHANCEDSTATUSCODES
250-8BITMIME
250 DSN
MAIL FROM: root@localhost
250 2.1.0 Ok
usermail@test.otus
502 5.5.2 Error: command not recognized
RCPT TO: usermail@test.otus
250 2.1.5 Ok
data
354 End data with <CR><LF>.<CR><LF>
very good mail
.
250 2.0.0 Ok: queued as DE878C0A88
quit
221 2.0.0 Bye
Connection closed by foreign host. 

```

* письмо
```
cat /var/mail/vhosts/test.otus/usermail/new/1544347062.M238892P17786.mailserv\,S\=370\,W\=380
Return-Path: <root@localhost>
Delivered-To: usermail@test.otus
Received: from mailserv
        by mailserv with LMTP id qIs0C7bdDFx6RQAAfXFM7g
        for <usermail@test.otus>; Sun, 09 Dec 2018 09:17:42 +0000
Received: from mail (unknown [192.168.255.2])
        by mailserv (Postfix) with ESMTP id DE878C0A88
        for <usermail@test.otus>; Sun,  9 Dec 2018 09:16:51 +0000 (UTC)

very good mail

```
* Log

```
Dec  9 09:17:42 mailserv dovecot: lmtp(usermail@test.otus): msgid=unspecified: saved mail to INBOX
Dec  9 09:17:42 mailserv dovecot: lmtp(17786): Disconnect from local: Successful quit
Dec  9 09:17:42 mailserv postfix/lmtp[17785]: DE878C0A88: to=<usermail@test.otus>, relay=mailserv[private/dovecot-lmtp], delay=51, delays=51/0.03/0.02/0.06, dsn=2.0.0, status=sent (250 2.0.0 <usermail@test.otus> qIs0C7bdDFx6RQAAfXFM7g Saved)
Dec  9 09:17:42 mailserv postfix/qmgr[17765]: DE878C0A88: removed
Dec  9 09:17:45 mailserv postfix/smtpd[17777]: disconnect from unknown[192.168.255.2]

```