# Защита от DDOS на основле модуля testcookie-nginx-module
https://github.com/kyprizel/testcookie-nginx-module

пересобираем nginx 

```
nginx version: nginx/1.15.7
built by gcc 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC)
built with OpenSSL 1.0.2k-fips  26 Jan 2017
TLS SNI support enabled
configure arguments: --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -pie' --add-module=../testcookie-nginx-module --with-http_geoip_module=dynamic
```

* testcookie_secret и testcookie_arg. Генерируем значения самостоятельно.
```
echo label | md5sum 
41cc0e4945e162021cfdd993f4c1104d  
echo defcon | md5sum 
15dbedaeabc7f0c09f0fe834e4a3b46a
```
* curl -s -L -I http://192.168.11.10
  * запрашиваем страницу
```
HTTP/1.1 307 Temporary Redirect
Server: nginx/1.15.7
Date: Sat, 01 Dec 2018 15:00:14 GMT
Content-Type: text/html
Content-Length: 171
Connection: keep-alive
Set-Cookie: XSAE=2da307afa1f1c414a8befb7e3cfae4a8; path=/
Location: http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=1

HTTP/1.1 307 Temporary Redirect
Server: nginx/1.15.7
Date: Sat, 01 Dec 2018 15:00:14 GMT
Content-Type: text/html
Content-Length: 171
Connection: keep-alive
Set-Cookie: XSAE=2da307afa1f1c414a8befb7e3cfae4a8; path=/
Location: http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=2

HTTP/1.1 307 Temporary Redirect
Server: nginx/1.15.7
Date: Sat, 01 Dec 2018 15:00:14 GMT
Content-Type: text/html
Content-Length: 171
Connection: keep-alive
Set-Cookie: XSAE=2da307afa1f1c414a8befb7e3cfae4a8; path=/
Location: http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=3

HTTP/1.1 403 Forbidden
Server: nginx/1.15.7
Date: Sat, 01 Dec 2018 15:00:14 GMT
Content-Type: text/html
Content-Length: 153
Connection: close
```

* wget --no-cookie http://192.168.11.10
  * запрашиваем без cookies
```
--2018-12-01 15:00:37--  http://192.168.11.10/
Connecting to 192.168.11.10:80... connected.
HTTP request sent, awaiting response... 307 Temporary Redirect
Location: http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=1 [following]
--2018-12-01 15:00:37--  http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=1
Reusing existing connection to 192.168.11.10:80.
HTTP request sent, awaiting response... 307 Temporary Redirect
Location: http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=2 [following]
--2018-12-01 15:00:37--  http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=2
Reusing existing connection to 192.168.11.10:80.
HTTP request sent, awaiting response... 307 Temporary Redirect
Location: http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=3 [following]
--2018-12-01 15:00:37--  http://192.168.11.10/?label_41cc0e4945e162021cfdd993f4c1104d=3
Reusing existing connection to 192.168.11.10:80.
HTTP request sent, awaiting response... 403 Forbidden
2018-12-01 15:00:37 ERROR 403: Forbidden.
```