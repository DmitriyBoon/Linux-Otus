!#/bin/bash
 # переменные 
RESTART="/etc/init.d/apache2 restart"
PGREP="/usr/bin/pgrep"
HTTPD="httpd"
 # Грепаем процесс
$PGREP ${HTTPD}
 # ищем запущен ли 
 if [ $? -ne 0 ] 
then 
 # Если не запущен тогда, перезапускаем.
 $RESTART
fi
