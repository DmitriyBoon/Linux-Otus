Создадим конфиг для инстанса и запишем в него опции: nano /etc/sysconfig/httpd-1

OPTIONS="-f /etc/httpd/conf/httpd-1.conf"
запускаем systemctl start httpd@1.service
http://prntscr.com/knc347
