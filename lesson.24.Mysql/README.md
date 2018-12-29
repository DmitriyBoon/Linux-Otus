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



на мастере
```
mysql> show tables;
+---------------------+
| Tables_in_bet       |
+---------------------+
| bookmaker           |
| competition         |
| events_on_demand    |
| market              |
| odds                |
| outcome             |
| v_same_event        |
+---------------------+
7 rows in set (0.01 sec)


добавляем в /etc/mysql/my.cfg

server-id = 1

log_bin = /var/log/mysql/mysql-bin.log

binlog_do_db = bet

mysql> GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%' IDENTIFIED BY 'password';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

mysql> use bet;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> FLUSH TABLES WITH READ LOCK;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW MASTER STATUS;
+------------------+----------+--------------+------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+------------------+----------+--------------+------------------+
| mysql-bin.000003 |      318 | sample       |                  |
+------------------+----------+--------------+------------------+
1 row in set (0.00 sec)


 mysqldump --triggers --routines --master-data --ignore-table=bet.events_on_demand --ignore-table=bet.v_same_event -uroot -proot bet > master.sql
```
на слейве

```
mysql> show tables;
+---------------+
| Tables_in_bet |
+---------------+
| bookmaker     |
| competition   |
| market        |
| odds          |
| outcome       |
+---------------+

добавляем в /etc/mysql/my.cfg
server-id = 2
relay-log = /var/log/mysql/mysql-relay-bin.log
log_bin = /var/log/mysql/mysql-bin.log

binlog_do_db = bet
replicate-wild-ignore-table==bet.events_on_demand
replicate-wild-ignore-table==bet.v_same_event


CHANGE MASTER TO MASTER_HOST='192.168.100.11', MASTER_USER='repl', MASTER_PASSWORD='password', MASTER_LOG_FILE = 'mysql-bin.000001', MASTER_LOG_POS = 318;

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 192.168.100.11
                  Master_User: repl
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000002
          Read_Master_Log_Pos: 318
               Relay_Log_File: mysqld-relay-bin.000002
                Relay_Log_Pos: 464
        Relay_Master_Log_File: mysql-bin.000002
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes

```