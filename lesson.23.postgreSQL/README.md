
# PostgreSQL Master - Slave
```
Конфиги в templates https://github.com/DmitriyBoon/otus-linux/tree/master/lesson.23.postgreSQL/roles/postgres/templates
```

* Устанавливаем master - slaves

```
yum -y install postgresql96-server postgresql96-contrib
cd /usr/pgsql-9.6/bin/
./postgresql96-setup initdb
systemctl start postgresql-9.6
systemctl enable postgresql-9.6

```



* Промоутим реплику до мастера

```
-bash-4.2$ pg_basebackup -h 192.168.255.1 -U repluser -D /var/lib/pgsql/9.6/data -P --xlog
Password:
38469/38469 kB (100%), 1/1 tablespace

```



* Проверяем

```
-bash-4.2$ psql -c "select application_name, state, sync_priority, sync_state from pg_stat_replication;"
Password:
 application_name |   state   | sync_priority | sync_state
------------------+-----------+---------------+------------
 walreceiver      | streaming |             0 | async
(1 row)

-bash-4.2$ psql -x -c "select * from pg_stat_replication;"
Password:
-[ RECORD 1 ]----+------------------------------
pid              | 6341
usesysid         | 16384
usename          | repluser
application_name | walreceiver
client_addr      | 192.168.255.2
client_hostname  |
client_port      | 46592
backend_start    | 2018-12-23 14:32:23.789942+00
backend_xmin     |
state            | streaming
sent_location    | 0/5000140
write_location   | 0/5000140
flush_location   | 0/5000140
replay_location  | 0/5000108
sync_priority    | 0
sync_state       | async
```

* Тестируем
 * На мастере

```

-bash-4.2$ psql
Password:
psql (9.6.11)
Type "help" for help.

postgres=# CREATE TABLE replica_test (test varchar(100));
CREATE TABLE
postgres=# INSERT INTO replica_test VALUES ('что то там.com');
INSERT 0 1
postgres=# INSERT INTO replica_test VALUES ('This is from Master');
INSERT 0 1
postgres=# INSERT INTO replica_test VALUES ('pg replication by otus-labs');
INSERT 0 1

```
  * На слейве 

```
[root@slave ~]# su postgres
bash-4.2$ psql
could not change directory to "/root": Permission denied
Password:
psql (9.6.11)
Type "help" for help.

postgres=# select * from replica_test;
             test
-------------------------------
 что то там.com
 This is from Master
 pg replication by otus-labs
(3 rows)

postgres=# INSERT INTO replica_test VALUES ('this is SLAVE');
ERROR:  cannot execute INSERT in a read-only transaction

```

* postgres.conf
```
listen_addresses = '192.168.255.1'      # what IP address(es) to listen on;
port = 5432                             # (change requires restart)
max_connections = 100                   # (change requires restart)
#password_encryption = md5               # md5 or scram-sha-256
shared_buffers = 128MB                  # min 128kB
dynamic_shared_memory_type = posix      # the default is the first option
wal_level = hot_standby                 # minimal, replica, or logical
fsync = on                              # flush data to disk for crash safety
wal_log_hints = on                      # also do full page writes of non-critical updates
max_wal_size = 1GB
min_wal_size = 80MB
archive_mode = on               # enables archiving; off, on, or always
archive_command = 'test ! -f /var/lib/pgsql/11/backup_in_progress || cp -i %p /var/lib/pgsql/11/backups/archive/%f < /dev/null'
max_wal_senders = 10            # max number of walsender processes
wal_keep_segments = 3           # in logfile segments; 0 disables
hot_standby = on                        # "off" disallows queries during recovery
```

* pg_hba.conf
```
local   all     all       md5
host    replication     all       192.168.255.0/24            md5
host    testdb     repluser       192.168.255.0/24            md5
```
* recovery.conf на слейве

```
standby_mode = 'on'
primary_conninfo = 'host=192.168.255.1 port=5432 user=repluser password=rep'
trigger_file = '/tmp/postgresql.trigger.5432'

```

* backup.sh - скрипт резевного копирования 










