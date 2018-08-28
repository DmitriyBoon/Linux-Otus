!#/bin/bash
 # переменные 
MAILALARM="mail -s "Что%20то%20пошло%20не%20так"  support@mail.local" # должен стоять майл агент
PGREP="/usr/bin/pgrep"
HTTPD="httpd"
 # Грепаем процесс
$PGREP ${HTTPD}
 # ищем запущен ли 
 if [ $? -ne 0 ] 
then 
 # Если не запущен тогда, шлем письмо.
 $RMAILALARM
fi
