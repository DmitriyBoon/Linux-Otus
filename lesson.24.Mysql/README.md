# Mysql репликация мастер слайв

Vagrant up  



* Скачиваем базу
```
root@mysqlmaster:/home# wget https://otus.ru/media/49/74/bet-4560-4974c3.dmp
--2018-12-24 22:11:37--  https://otus.ru/media/49/74/bet-4560-4974c3.dmp
Resolving otus.ru (otus.ru)... 80.87.192.10
Connecting to otus.ru (otus.ru)|80.87.192.10|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 117778 (115K) [application/octet-stream]
Saving to: `bet-4560-4974c3.dmp'

100%[======================================================================================================>] 117,778     --.-K/s   in 0.009s

2018-12-24 22:11:37 (12.5 MB/s) - `bet-4560-4974c3.dmp' saved [117778/117778]

```

* Импортируем

```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| bet                |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.01 sec)

mysql> use bet;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> source /home/bet.dmp
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

```

* Создаем пользователя, даем права, идем на мастера.

```
mysql> CREATE USER 'repl'@'localhost' IDENTIFIED BY '!OtusLinux2018';
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT user,host FROM mysql.user where user='repl'
    -> ;
+------+-----------+
| user | host      |
+------+-----------+
| repl | %         |
| repl | localhost |
+------+-----------+
2 rows in set (0.00 sec)

mysql> GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%' IDENTIFIED BY '!OtusLinux2018';
Query OK, 0 rows affected (0.00 sec)

mysql> GRANT REPLICATION SLAVE ON *.* TO 'repl'@'localhost' IDENTIFIED BY '!OtusLinux2018';
Query OK, 0 rows affected (0.00 sec)

```

* Запускаем slave

```
mysql> STOP SLAVE;
Query OK, 0 rows affected (0.00 sec)

mysql> CHANGE MASTER TO MASTER_HOST='192.168.100.11', MASTER_USER='repl', MASTER_PASSWORD='!OtusLinux2018', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 107;
Query OK, 0 rows affected (0.01 sec)

mysql> START SLAVE;
Query OK, 0 rows affected (0.00 sec)

mysql>  SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 192.168.100.11
                  Master_User: repl
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000002
          Read_Master_Log_Pos: 519
               Relay_Log_File: mysqld-relay-bin.000002
                Relay_Log_Pos: 400
        Relay_Master_Log_File: mysql-bin.000001
             Slave_IO_Running: Yes
            Slave_SQL_Running: No
              Replicate_Do_DB:

```


* Проверяем, на мастере
```
 use bet;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> INSERT INTO bookmaker (id,bookmaker_name) VALUES(1,'1xbet');
Query OK, 1 row affected (0.00 sec)

mysql>  SELECT * FROM bookmaker;
+----+----------------+
| id | bookmaker_name |
+----+----------------+
|  1 | 1xbet          |
|  4 | betway         |
|  5 | bwin           |
|  6 | ladbrokes      |
|  3 | unibet         |
+----+----------------+
5 rows in set (0.00 sec)
```
* На слейве

```
mysql>  SELECT * FROM bookmaker;
+----+----------------+
| id | bookmaker_name |
+----+----------------+
|  1 | 1xbet          |
|  4 | betway         |
|  5 | bwin           |
|  6 | ladbrokes      |
|  3 | unibet         |
+----+----------------+
5 rows in set (0.00 sec)
```

