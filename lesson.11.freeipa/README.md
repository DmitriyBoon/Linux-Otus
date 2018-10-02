
# Роли Freeipa Server & Client ansible
```
Содержит 3 роли 
Server - установка сервера
Common - общая роль настройки конфигураций машин
Client - установка и настройка клиента
```
* Для установки разоврачиваем машины, устанавливаем ansible.
* Копируем содержимое в /etc/ansible
* Правим перменные /etc/ansible/group_vars/all.yml
* Правим hosts под собственные нужны
```
Установка и настройка сервера ansible-playbook freeipa-server.yml
Уставнока клиентов и настройка клиентов ansible-playbook freeipa-client.yml
```


p.s. роль еще тестируется на разных платформах
