# 1. Создаем RPM
Ставим пакеты
     yum install rpmdevtools rpm-build
создаем директории
     rpmdev-setuptree
     tree -d -L 1 ~/rpmbuild
     yum install tree
     tree -d -L 1 ~/rpmbuild
Качаем исходники http://hg.nginx.org/pkg-oss/archive/tip.tar.gz/rpm/
SOURCES архив с иходниками
SPECS spec сюда
собираем rpmbuild -bb SPECS/nginx.spec 
В первый раз ошибка, доустановим зависимости.
второй раз rpmbuild -bb SPECS/nginx.spec 
Собравлось http://prntscr.com/kp2gz6
ставим rpm -i 
работает тут http://159.69.144.32

2. Создаем репозиторий

yum install createrepo

создаем папки под репозиторий mkdir /var/www/repos/nginx
перекладываем туда файлы 
createrepo nginx/
правим конфиг nginx 
vi /etc/nginx/conf.d/default.conf 


добвляем секцию 
location /nginx/ {
  alias /var/www/repos/nginx/;
  autoindex on;
  autoindex_exact_size off;
  autoindex_localtime on;
проверяем nginx -t 
рестартуем 
systemctl restart nginx 
работает тут http://159.69.144.32/nginx/
