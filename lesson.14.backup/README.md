
# Backup Bacula


```
*list jobs
+-------+---------------+---------------------+------+-------+----------+-------------+-----------+
| jobid | name          | starttime           | type | level | jobfiles | jobbytes    | jobstatus |
+-------+---------------+---------------------+------+-------+----------+-------------+-----------+
|     1 | BackupClient1 | 2018-10-13 16:00:00 | B    | F     |    4,484 | 241,479,724 | T         |
|     2 | BackupClient1 | 2018-10-13 16:00:10 | B    | F     |    4,484 | 241,479,924 | T         |
|     3 | BackupClient1 | 2018-10-13 16:00:13 | B    | F     |    4,484 | 241,480,124 | T         |
|     4 | BackupClient1 | 2018-10-13 16:00:16 | B    | F     |    4,484 | 241,480,324 | T         |
|     5 | BackupClient1 | 2018-10-13 16:00:19 | B    | F     |    4,484 | 241,480,524 | T         |
|     6 | BackupClient1 | 2018-10-13 16:00:22 | B    | F     |    4,484 | 241,480,724 | T         |
|     7 | BackupClient1 | 2018-10-13 16:00:25 | B    | F     |    4,484 | 241,480,924 | T         |
|     8 | BackupClient1 | 2018-10-13 16:00:28 | B    | F     |    4,484 | 241,481,124 | T         |
|     9 | BackupClient1 | 2018-10-13 16:00:31 | B    | F     |    4,484 | 241,481,324 | T         |
|    10 | BackupClient1 | 2018-10-13 16:00:34 | B    | F     |    4,484 | 241,481,524 | T         |
|    11 | BackupClient1 | 2018-10-13 16:00:37 | B    | F     |    4,484 | 241,481,724 | T         |
|    12 | BackupClient1 | 2018-10-13 16:00:52 | B    | I     |        3 |       2,196 | T         |
|    13 | BackupClient1 | 2018-10-13 16:10:49 | B    | I     |        8 |   1,090,816 | T         |
|    14 | BackupClient1 | 2018-10-13 16:10:53 | B    | I     |        3 |       2,196 | T         |
|    15 | BackupClient1 | 2018-10-13 16:30:02 | B    | I     |        5 |   1,087,086 | T         |
|    16 | BackupClient1 | 2018-10-13 17:00:00 | B    | I     |        5 |       2,238 | T         |
|    17 | BackupClient1 | 2018-10-13 17:00:02 | B    | I     |        5 |       2,238 | T         |
|    18 | BackupClient1 | 2018-10-13 17:00:04 | B    | I     |        5 |       2,238 | T         |
|    19 | BackupClient1 | 2018-10-13 17:00:05 | B    | I     |        5 |       2,238 | T         |
|    20 | BackupClient1 | 2018-10-13 17:00:07 | B    | I     |        5 |       2,238 | T         |
|    21 | BackupClient1 | 2018-10-13 17:00:07 | B    | I     |        5 |       2,238 | T         |
|    22 | BackupClient1 | 2018-10-13 17:00:09 | B    | I     |        5 |       2,238 | T         |
|    23 | BackupClient1 | 2018-10-13 17:00:10 | B    | I     |        5 |       2,238 | T         |
|    24 | BackupClient1 | 2018-10-13 17:00:11 | B    | I     |        5 |       2,238 | T         |
|    25 | BackupClient1 | 2018-10-13 17:00:12 | B    | I     |        5 |       2,238 | T         |
|    26 | BackupClient1 | 2018-10-13 17:00:13 | B    | I     |        5 |       2,238 | T         |
|    27 | BackupClient1 | 2018-10-13 17:30:02 | B    | I     |        8 |   1,093,930 | T         |
|    28 | BackupClient1 | 2018-10-13 18:00:00 | B    | I     |        3 |       2,196 | T         |
|    29 | BackupClient1 | 2018-10-13 18:00:02 | B    | I     |        3 |       2,196 | T         |
|    30 | BackupClient1 | 2018-10-13 18:00:03 | B    | I     |        3 |       2,196 | T         |
|    31 | BackupClient1 | 2018-10-13 18:00:04 | B    | I     |        3 |       2,196 | T         |
|    32 | BackupClient1 | 2018-10-13 18:00:05 | B    | I     |        3 |       2,196 | T         |
|    33 | BackupClient1 | 2018-10-13 18:00:05 | B    | I     |        3 |       2,196 | T         |
|    34 | BackupClient1 | 2018-10-13 18:00:07 | B    | I     |        3 |       2,196 | T         |
|    35 | BackupClient1 | 2018-10-13 18:00:07 | B    | I     |        3 |       2,196 | T         |
|    36 | BackupClient1 | 2018-10-13 18:00:08 | B    | I     |        3 |       2,196 | T         |
|    37 | BackupClient1 | 2018-10-13 18:00:09 | B    | I     |        3 |       2,196 | T         |
|    38 | BackupClient1 | 2018-10-13 18:00:10 | B    | I     |        3 |       2,196 | T         |
|    39 | BackupClient1 | 2018-10-13 18:30:02 | B    | I     |       10 |   1,096,426 | T         |
|    40 | BackupClient1 | 2018-10-13 19:00:00 | B    | I     |        3 |       2,196 | T         |
|    41 | BackupClient1 | 2018-10-13 19:00:02 | B    | I     |        3 |       2,196 | T         |
|    42 | BackupClient1 | 2018-10-13 19:00:03 | B    | I     |        3 |       2,196 | T         |
|    43 | BackupClient1 | 2018-10-13 19:00:04 | B    | I     |        3 |       2,196 | T         |
|    44 | BackupClient1 | 2018-10-13 19:00:05 | B    | I     |        3 |       2,196 | T         |
|    45 | BackupClient1 | 2018-10-13 19:00:07 | B    | I     |        3 |       2,196 | T         |
|    46 | BackupClient1 | 2018-10-13 19:00:08 | B    | I     |        3 |       2,196 | T         |
|    47 | BackupClient1 | 2018-10-13 19:00:09 | B    | I     |        3 |       2,196 | T         |
|    48 | BackupClient1 | 2018-10-13 19:00:10 | B    | I     |        3 |       2,196 | T         |
|    49 | BackupClient1 | 2018-10-13 19:00:11 | B    | I     |        3 |       2,196 | T         |
|    50 | BackupClient1 | 2018-10-13 19:00:12 | B    | I     |        3 |       2,196 | T         |
+-------+---------------+---------------------+------+-------+----------+-------------+-----------+
```
```*list files jobid=1
+----------------------------------------------------------------------------------------------------+
| filename                                                                                             |
+----------------------------------------------------------------------------------------------------+
| /var/                                                                                                |
| /var/.updated                                                                                        |
| /var/kerberos/                                                                                       |
| /var/kerberos/krb5/                                                                                  |
| /var/kerberos/krb5/user/                                                                             |
| /var/yp/                                                                                             |
| /var/spool/                                                                                          |
| /var/spool/bacula/                                                                                   |
| /var/spool/bacula/bacula-fd.9102.state                                                               |
| /var/spool/postfix/                                                                                  |
| /var/spool/postfix/trace/                                                                            |
| /var/spool/postfix/saved/                                                                            |
| /var/spool/postfix/public/                                                                           |
| /var/spool/postfix/private/                                                                          |
| /var/spool/postfix/pid/                                                                              |
| /var/spool/postfix/pid/master.pid                                                                    |
| /var/spool/postfix/hold/                                                                             |
| /var/spool/postfix/flush/                                                                            |
| /var/spool/postfix/deferred/                                                                         |
| /var/spool/postfix/defer/                                                                            |
| /var/spool/postfix/corrupt/                                                                          |
| /var/spool/postfix/bounce/                                                                           |
| /var/spool/postfix/active/                                                                           |
| /var/spool/plymouth/                                                                                 |
| /var/spool/cron/                                                                                     |
| /var/spool/anacron/                                                                                  |
| /var/spool/anacron/cron.monthly                                                                      |
| /var/spool/anacron/cron.weekly                                                                       |
| /var/spool/anacron/cron.daily                                                                        |
| /var/spool/mail/                                                                                     |
| /var/spool/mail/vagrant                                                                              |
| /var/spool/mail/rpc                                                                                  |
| /var/spool/lpd/                                                                                      |
| /var/preserve/                                                                                       |
| /var/opt/                                                                                            |
| /var/nis/                                                                                            |
| /var/mail                                                                                            |
| /var/local/                                                                                          |
| /var/gopher/                                                                                         |
| /var/games/                                                                                          |
| /var/empty/                                                                                          |
| /var/empty/sshd/                                                                                     |
| /var/db/                                                                                             |
| /var/db/sudo/                                                                                        |
| /var/db/sudo/lectured/                                                                               |
| /var/db/Makefile                                                                                     |
| /var/cache/                                                                                          |
| /var/cache/man/                                                                                      |
| /var/cache/man/local/                                                                                |
| /var/cache/man/local/index.db                                                                        |
| /var/cache/man/local/cat9/                                                                           |
| /var/cache/man/local/cat8/                                                                           |
| /var/cache/man/local/cat7/                                                                           |
| /var/cache/man/local/cat6/                                                                           |
| /var/cache/man/local/cat5/                                                                           |
| /var/cache/man/local/cat4/                                                                           |
| /var/cache/man/local/cat3/                                                                           |
| /var/cache/man/local/cat2/                                                                           |
| /var/cache/man/local/cat1/                                                                           |
| /var/cache/man/sr/                                                                                   |
| /var/cache/man/sr/index.db                                                                           |
| /var/cache/man/sr/cat1/                                                                              |
| /var/cache/man/hu/                                                                                   |
| /var/cache/man/hu/index.db                                                                           |
| /var/cache/man/hu/cat1/                                                                              |
| /var/cache/man/es/                                                                                   |
| /var/cache/man/es/index.db                                                                           |
| /var/cache/man/es/cat1/                                                                              |
| /var/cache/man/ru/                                                                                   |
| /var/cache/man/ru/index.db                                                                           |
| /var/cache/man/ru/cat1/                                                                              |
| /var/cache/man/pl/                                                                                   |
| /var/cache/man/pl/index.db                                                                           |
| /var/cache/man/pl/cat1/                                                                              |
| /var/cache/man/ja/                                                                                   |
| /var/cache/man/ja/index.db                                                                           |
| /var/cache/man/ja/cat1/                                                                              |
| /var/cache/man/it/                                                                                   |
| /var/cache/man/it/index.db                                                                           |
| /var/cache/man/it/cat1/                                                                              |
| /var/cache/man/fr/                                                                                   |
| /var/cache/man/fr/index.db                                                                           |
| /var/cache/man/fr/cat1/                                                                              |
| /var/cache/man/index.db                                                                              |
| /var/cache/man/cat9/                                                                                 |
| /var/cache/man/cat8/                                                                                 |
| /var/cache/man/cat7/                                                                                 |
| /var/cache/man/cat6/                                                                                 |
| /var/cache/man/cat5/                                                                                 |
| /var/cache/man/cat4/                                                                                 |
| /var/cache/man/cat3/                                                                                 |
| /var/cache/man/cat2/                                                                                 |
| /var/cache/man/cat1/                                                                                 |
| /var/cache/man/CACHEDIR.TAG                                                                          |
| /var/cache/yum/                                                                                      |
| /var/cache/yum/x86_64/                                                                               |
| /var/cache/yum/x86_64/7/                                                                             |
| /var/cache/yum/x86_64/7/epel/                                                                        |
| /var/cache/yum/x86_64/7/epel/08dfa55751e29abdcf3c6503d6cc735f3aa36b4da5e0d27fa8655b16b4769448-primary.xml.gz |
| /var/cache/yum/x86_64/7/epel/14586a9dea387675bdbeef0d315ff5de6e066608d92553e8c506fed71277c1b4-updateinfo.xml.bz2 |
| /var/cache/yum/x86_64/7/epel/d97ad2922a45eb2a5fc007fdd84e7ae4981b257d3b94c3c9f5d7b0dda6baa098-comps-Everything.x86_64.xml.gz |
| /var/cache/yum/x86_64/7/epel/cachecookie                                                             |
| /var/cache/yum/x86_64/7/epel/repomd.xml                                                              |
| /var/cache/yum/x86_64/7/epel/metalink.xml                                                            |
| /var/cache/yum/x86_64/7/epel/packages/                                                               |
| /var/cache/yum/x86_64/7/epel/gen/                                                                    |
| /var/cache/yum/x86_64/7/epel/gen/primary.xml.sqlite                                                  |
| /var/cache/yum/x86_64/7/epel/gen/primary.xml                                                         |
| /var/cache/yum/x86_64/7/.gpgkeyschecked.yum                                                          |
| /var/cache/yum/x86_64/7/timedhosts                                                                   |
| /var/cache/yum/x86_64/7/updates/                                                                     |
| /var/cache/yum/x86_64/7/updates/da171da0658b69aa3475f595e9840b5759f20121f9e16fba63dc9bad679527aa-prestodelta.xml.gz |
| /var/cache/yum/x86_64/7/updates/5677edfcda06c552d4cc91cf6aee9857390d1848b487111e91db14e954c9ee04-primary.sqlite.bz2 |
| /var/cache/yum/x86_64/7/updates/cachecookie                                                          |
| /var/cache/yum/x86_64/7/updates/repomd.xml                                                           |
| /var/cache/yum/x86_64/7/updates/mirrorlist.txt                                                       |
| /var/cache/yum/x86_64/7/updates/packages/                                                            |
| /var/cache/yum/x86_64/7/updates/packages/yum-utils-1.1.31-45.el7_1.1.31-46.el7_5.noarch.drpm         |
| /var/cache/yum/x86_64/7/updates/packages/yum-plugin-fastestmirror-1.1.31-45.el7_1.1.31-46.el7_5.noarch.drpm |
| /var/cache/yum/x86_64/7/updates/packages/util-linux-2.23.2-52.el7_2.23.2-52.el7_5.1.x86_64.drpm      |
| /var/cache/yum/x86_64/7/updates/packages/tuned-2.9.0-1.el7_2.9.0-1.el7_5.2.noarch.drpm               |
| /var/cache/yum/x86_64/7/updates/packages/systemd-219-57.el7_219-57.el7_5.3.x86_64.drpm               |
| /var/cache/yum/x86_64/7/updates/packages/sudo-1.8.19p2-13.el7_1.8.19p2-14.el7_5.x86_64.drpm          |
| /var/cache/yum/x86_64/7/updates/packages/rsyslog-8.24.0-16.el7_8.24.0-16.el7_5.4.x86_64.drpm         |
| /var/cache/yum/x86_64/7/updates/packages/python-libs-2.7.5-68.el7_2.7.5-69.el7_5.x86_64.drpm         |
| /var/cache/yum/x86_64/7/updates/packages/nss-tools-3.34.0-4.el7_3.36.0-7.el7_5.x86_64.drpm           |
| /var/cache/yum/x86_64/7/updates/packages/python-2.7.5-68.el7_2.7.5-69.el7_5.x86_64.drpm              |
| /var/cache/yum/x86_64/7/updates/packages/procps-ng-3.3.10-17.el7_3.3.10-17.el7_5.2.x86_64.drpm       |
| /var/cache/yum/x86_64/7/updates/packages/openldap-2.4.44-13.el7_2.4.44-15.el7_5.x86_64.drpm          |
| /var/cache/yum/x86_64/7/updates/packages/nss-3.34.0-4.el7_3.36.0-7.el7_5.x86_64.drpm                 |
| /var/cache/yum/x86_64/7/updates/packages/mariadb-libs-5.5.56-2.el7_5.5.60-1.el7_5.x86_64.drpm        |
| /var/cache/yum/x86_64/7/updates/packages/libss-1.42.9-11.el7_1.42.9-12.el7_5.x86_64.drpm             |
| /var/cache/yum/x86_64/7/updates/packages/libmount-2.23.2-52.el7_2.23.2-52.el7_5.1.x86_64.drpm        |
| /var/cache/yum/x86_64/7/updates/packages/libgomp-4.8.5-28.el7_4.8.5-28.el7_5.1.x86_64.drpm           |
| /var/cache/yum/x86_64/7/updates/packages/initscripts-9.49.41-1.el7_9.49.41-1.el7_5.2.x86_64.drpm     |
| /var/cache/yum/x86_64/7/updates/packages/libgcc-4.8.5-28.el7_4.8.5-28.el7_5.1.x86_64.drpm            |
| /var/cache/yum/x86_64/7/updates/packages/libcom_err-1.42.9-11.el7_1.42.9-12.el7_5.x86_64.drpm        |
| /var/cache/yum/x86_64/7/updates/packages/libblkid-2.23.2-52.el7_2.23.2-52.el7_5.1.x86_64.drpm        |
| /var/cache/yum/x86_64/7/updates/packages/iptables-1.4.21-24.el7_1.4.21-24.1.el7_5.x86_64.drpm        |
| /var/cache/yum/x86_64/7/updates/packages/gnupg2-2.0.22-4.el7_2.0.22-5.el7_5.x86_64.drpm              |
| /var/cache/yum/x86_64/7/updates/packages/firewalld-0.4.4.4-14.el7_0.4.4.4-15.el7_5.noarch.drpm       |
| /var/cache/yum/x86_64/7/updates/packages/e2fsprogs-libs-1.42.9-11.el7_1.42.9-12.el7_5.x86_64.drpm    |
| /var/cache/yum/x86_64/7/updates/packages/e2fsprogs-1.42.9-11.el7_1.42.9-12.el7_5.x86_64.drpm         |
| /var/cache/yum/x86_64/7/updates/packages/dracut-033-535.el7_033-535.el7_5.1.x86_64.drpm              |
| /var/cache/yum/x86_64/7/updates/packages/dhcp-common-4.2.5-68.el7.centos_4.2.5-68.el7.centos.1.x86_64.drpm |
| /var/cache/yum/x86_64/7/updates/packages/dhclient-4.2.5-68.el7.centos_4.2.5-68.el7.centos.1.x86_64.drpm |
| /var/cache/yum/x86_64/7/updates/packages/centos-release-7-5.1804.el7.centos_7-5.1804.5.el7.centos.x86_64.drpm |
| /var/cache/yum/x86_64/7/updates/packages/ca-certificates-2017.2.20-71.el7_2018.2.22-70.0.el7_5.noarch.drpm |
| /var/cache/yum/x86_64/7/updates/packages/binutils-2.27-27.base.el7_2.27-28.base.el7_5.1.x86_64.drpm  |
| /var/cache/yum/x86_64/7/updates/packages/audit-libs-2.8.1-3.el7_2.8.1-3.el7_5.1.x86_64.drpm          |
| /var/cache/yum/x86_64/7/updates/packages/audit-2.8.1-3.el7_2.8.1-3.el7_5.1.x86_64.drpm               |
| /var/cache/yum/x86_64/7/updates/packages/NetworkManager-libnm-1.10.2-13.el7_1.10.2-16.el7_5.x86_64.drpm |
| /var/cache/yum/x86_64/7/updates/gen/                                                                 |
| /var/cache/yum/x86_64/7/updates/gen/prestodelta.xml                                                  |
| /var/cache/yum/x86_64/7/updates/gen/primary_db.sqlite                                                |
| /var/cache/yum/x86_64/7/extras/                                                                      |
| /var/cache/yum/x86_64/7/extras/9faf17d19bd69606dfc218252ccb221d02cbcf64b4a1ad679790c22a4f2c38de-primary.sqlite.bz2 |
| /var/cache/yum/x86_64/7/extras/cachecookie                                                           |
| /var/cache/yum/x86_64/7/extras/repomd.xml                                                            |
| /var/cache/yum/x86_64/7/extras/mirrorlist.txt                                                        |
| /var/cache/yum/x86_64/7/extras/packages/                                                             |
| /var/cache/yum/x86_64/7/extras/gen/                                                                  |
| /var/cache/yum/x86_64/7/extras/gen/primary_db.sqlite                                                 |
| /var/cache/yum/x86_64/7/timedhosts.txt                                                               |
| /var/cache/yum/x86_64/7/base/                                                                        |
| /var/cache/yum/x86_64/7/base/03d0a660eb33174331aee3e077e11d4c017412d761b7f2eaa8555e7898e701e0-primary.sqlite.bz2 |
| /var/cache/yum/x86_64/7/base/29b154c359eaf12b9e35d0d5c649ebd62ce43333f39f02f33ed7b08c3b927e20-c7-x86_64-comps.xml.gz |
| /var/cache/yum/x86_64/7/base/cachecookie                                                             |
| /var/cache/yum/x86_64/7/base/repomd.xml                                                              |
| /var/cache/yum/x86_64/7/base/mirrorlist.txt                                                          |
| /var/cache/yum/x86_64/7/base/packages/                                                               |
| /var/cache/yum/x86_64/7/base/gen/                                                                    |
| /var/cache/yum/x86_64/7/base/gen/primary_db.sqlite                                                   |
| /var/cache/ldconfig/                                                                                 |
| /var/cache/ldconfig/aux-cache                                                                        |
| /var/adm/                                                                                            |
| /var/log/                                                                                            |
| /var/log/dmesg                                                                                       |
| /var/log/dmesg.old                                                                                   |
| /var/log/bacula/                                                                                     |
| /var/log/grubby                                                                                      |
| /var/log/yum.log                                                                                     |
| /var/log/cron                                                                                        |
| /var/log/boot.log                                                                                    |
| /var/log/anaconda/anaconda.log                                                                       |
| /var/log/chrony/                                                                                     |
| /var/log/qemu-ga/                                                                                    |
| /var/log/spooler                                                                                     |
| /var/log/maillog                                                                                     |
| /var/log/secure                                                                                      |
| /var/log/messages                                                                                    |
| /var/log/audit/                                                                                      |
| /var/log/audit/audit.log                                                                             |
| /var/log/tuned/                                                                                      |
| /var/log/tuned/tuned.log                                                                             |
| /var/log/wtmp                                                                                        |
| /var/log/btmp                                                                                        |
| /var/log/lastlog                                                                                     |
| /var/log/grubby_prune_debug                                                                          |
| /var/log/tallylog                                                                                    |
| /var/lock                                                                                            |
| /var/run                                                                                             |
| /var/lib/                                                                                            |
| /var/lib/chrony/                                                                                     |
| /var/lib/chrony/drift                                                                                |
| /var/lib/rsyslog/                                                                                    |
| /var/lib/rsyslog/imjournal.state                                                                     |
| /var/lib/postfix/                                                                                    |
| /var/lib/postfix/master.lock                                                                         |
| /var/lib/authconfig/                                                                                 |
| /var/lib/authconfig/last/                                                                            |
| /var/lib/authconfig/last/authconfig                                                                  |
| /var/lib/authconfig/last/login.defs                                                                  |
| /var/lib/authconfig/last/libuser.conf                                                                |
| /var/lib/authconfig/last/openldap.conf                                                               |
| /var/lib/nfs/                                                                                        |
| /var/lib/nfs/xtab                                                                                    |
| /var/lib/nfs/v4recovery/                                                                             |
| /var/lib/nfs/state                                                                                   |
| /var/lib/nfs/statd/                                                                                  |
| /var/lib/nfs/statd/sm.bak/                                                                           |
| /var/lib/nfs/statd/sm/                                                                               |
| /var/lib/nfs/rpc_pipefs/                                                                             |
| /var/lib/nfs/rmtab                                                                                   |
| /var/lib/nfs/etab                                                                                    |
| /var/lib/tuned/                                                                                      |
| /var/lib/dhclient/                                                                                   |
| /var/lib/plymouth/                                                                                   |
| /var/lib/plymouth/boot-duration                                                                      |
| /var/lib/gssproxy/                                                                                   |
| /var/lib/gssproxy/rcache/                                                                            |
| /var/lib/gssproxy/clients/                                                                           |
| /var/lib/NetworkManager/                                                                             |
| /var/lib/NetworkManager/dhclient-eth0.conf                                                           |
| /var/lib/NetworkManager/NetworkManager.state                                                         |
| /var/lib/NetworkManager/dhclient-afe29e8d-18bb-3b84-9008-8b4c26df7220-eth1.lease                     |
| /var/lib/NetworkManager/secret_key                                                                   |
| /var/lib/NetworkManager/timestamps                                                                   |
| /var/lib/NetworkManager/dhclient-5fb06bd0-0bb0-7ffb-45f1-d6edd65f3e03-eth0.lease                     |
| /var/lib/NetworkManager/NetworkManager-intern.conf                                                   |
| /var/lib/hyperv/                                                                                     |
| /var/lib/stateless/                                                                                  |
| /var/lib/stateless/writable/                                                                         |
| /var/lib/stateless/state/                                                                            |
| /var/lib/os-prober/                                                                                  |
| /var/lib/rpcbind/                                                                                    |
| /var/lib/polkit-1/                                                                                   |
| /var/lib/polkit-1/localauthority/                                                                    |
| /var/lib/polkit-1/localauthority/90-mandatory.d/                                                     |
| /var/lib/polkit-1/localauthority/50-local.d/                                                         |
| /var/lib/polkit-1/localauthority/30-site.d/                                                          |
| /var/lib/polkit-1/localauthority/20-org.d/                                                           |
| /var/lib/polkit-1/localauthority/10-vendor.d/                                                        |
| /var/lib/dbus/                                                                                       |
| /var/lib/machines/                                                                                   |
| /var/lib/systemd/                                                                                    |
| /var/lib/systemd/coredump/                                                                           |
| /var/lib/systemd/random-seed                                                                         |
| /var/lib/systemd/catalog/                                                                            |
| /var/lib/systemd/catalog/database                                                                    |
| /var/lib/initramfs/                                                                                  |
| /var/lib/logrotate/                                                                                  |
| /var/lib/logrotate/logrotate.status                                                                  |
| /var/lib/rpm-state/                                                                                  |
| /var/lib/misc/                                                                                       |
| /var/lib/misc/postfix.aliasesdb-stamp                                                                |
| /var/lib/games/                                                                                      |
| /var/lib/alternatives/                                                                               |
| /var/lib/alternatives/mta                                                                            |
| /var/lib/alternatives/ld                                                                             |
| /var/lib/alternatives/libnssckbi.so.x86_64                                                           |
| /var/lib/rpm/                                                                                        |
| /var/lib/rpm/.rpm.lock                                                                               |
| /var/lib/yum/rpmdb-indexes/obsoletes                                                                 |
| /var/lib/yum/rpmdb-indexes/conflicts                                                                 |
| /var/lib/yum/rpmdb-indexes/file-requires                                                             |
| /var/lib/yum/history/                                                                                |
| /var/lib/yum/history/2018-05-12/                                                                     |
| /var/lib/yum/history/2018-05-12/4/                                                                   |
| /var/lib/yum/history/2018-05-12/4/saved_tx                                                           |
| /var/lib/yum/history/2018-05-12/4/config-repos                                                       |
| /var/lib/yum/history/2018-05-12/4/config-main                                                        |
| /var/lib/yum/history/2018-05-12/3/                                                                   |
| /var/lib/yum/history/2018-05-12/3/saved_tx                                                           |
| /var/lib/yum/history/2018-05-12/3/config-repos                                                       |
| /var/lib/yum/history/2018-05-12/3/config-main                                                        |
| /var/lib/yum/history/2018-05-12/2/                                                                   |
| /var/lib/yum/history/2018-05-12/2/saved_tx                                                           |
| /var/lib/yum/history/2018-05-12/2/config-repos                                                       |
| /var/lib/yum/history/2018-05-12/2/config-main                                                        |
| /var/lib/yum/history/2018-05-12/1/                                                                   |
| /var/lib/yum/history/2018-05-12/1/config-repos                                                       |
| /var/lib/yum/history/2018-05-12/1/config-main                                                        |
| /var/lib/yum/history/history-2018-05-12.sqlite-journal                                               |
| /var/lib/yum/history/history-2018-05-12.sqlite                                                       |
| /var/lib/yum/uuid                                                                                    |
| /var/lib/yum/yumdb/                                                                                  |
| /var/lib/yum/yumdb/G/                                                                                |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/             |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/installed_by |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/from_repo_timestamp |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/from_repo_revision |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/checksum_data |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/checksum_type |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/ts_install_langs |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/var_uuid     |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/releasever   |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/reason       |
| /var/lib/yum/yumdb/G/5d1d730c5f843277da5723b9d79e05fa10cd8019-GeoIP-1.5.0-11.el7-x86_64/from_repo    |
| /var/lib/yum/yumdb/z/                                                                                |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/              |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/installed_by  |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/from_repo_timestamp |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/from_repo_revision |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/checksum_data |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/checksum_type |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/ts_install_langs |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/var_uuid      |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/releasever    |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/reason        |
| /var/lib/yum/yumdb/z/b58d04f39e62279ec0e12532a721fbb028984143-zlib-1.2.7-17.el7-x86_64/from_repo     |
| /var/lib/yum/yumdb/q/                                                                                |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/ |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/changed_by |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/installed_by |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/from_repo_timestamp |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/from_repo_revision |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/origin_url |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-agent-2.8.0-2.el7_5.1-x86_64/checksum_data |
| /var/lib/yum/yumdb/q/a1b619fc527c346ad245301a016b364cb31cc2cd-qemu-guest-a
| /var/lib/yum/yumdb/d/36cafaedc68db93e6b28924572bf2d213c3d84c3-device-mapper-persistent-data-0.7.3-3.el7-x86_64/checksum_type |
| /var/lib/yum/yumdb/d/36cafaedc68db93e6b28924572bf2d213c3d84c3-device-mapper-persistent-data-0.7.3-3.el7-x86_64/ts_install_langs |
| /var/lib/yum/yumdb/d/36cafaedc68db93e6b28924572bf2d213c3d84c3-device-mapper-persistent-data-0.7.3-3.el7-x86_64/var_uuid |
| /var/lib/yum/yumdb/d/36cafaedc68db93e6b28924572bf2d213c3d84c3-device-mapper-persistent-data-0.7.3-3.el7-x86_64/releasever |
| /var/lib/yum/yumdb/d/36cafaedc68db93e6b28924572bf2d213c3d84c3-device-mapper-persistent-data-0.7.3-3.el7-x86_64/reason |
| /var/lib/yum/yumdb/d/36cafaedc68db93e6b28924572bf2d213c3d84c3-device-mapper-persistent-data-0.7.3-3.el7-x86_64/from_repo |
| /var/lib/yum/repos/                                                                                  |
| /var/lib/yum/repos/x86_64/                                                                           |
| /var/lib/yum/repos/x86_64/7/                                                                         |
| /var/lib/yum/repos/x86_64/7/epel/                                                                    |
| /var/lib/yum/repos/x86_64/7/updates/                                                                 |
| /var/lib/yum/repos/x86_64/7/extras/                                                                  |
| /var/lib/yum/repos/x86_64/7/base/                                                                    |
| /var/lib/yum/repos/x86_64/7/anaconda/                                                                |
| /var/lib/yum/repos/x86_64/7/koji-override-1/                                                         |
| /var/lib/yum/repos/x86_64/7/koji-override-0/                                                         |
| /var/tmp/                                                                                            |
| /var/tmp/systemd-private-bed93a048dff4bacbdcdc04d3712e6e0-chronyd.service-uBCQr5/                    |
| /var/tmp/systemd-private-bed93a048dff4bacbdcdc04d3712e6e0-chronyd.service-uBCQr5/tmp/                |
+----------------------------------------------------------------------------------------------------+
+-------+---------------+---------------------+------+-------+----------+-------------+-----------+
| jobid | name          | starttime           | type | level | jobfiles | jobbytes    | jobstatus |
+-------+---------------+---------------------+------+-------+----------+-------------+-----------+
|     1 | BackupClient1 | 2018-10-13 16:00:00 | B    | F     |    4,484 | 241,479,724 | T         |
+-------+---------------+---------------------+------+-------+----------+-------------+-----------+


```
