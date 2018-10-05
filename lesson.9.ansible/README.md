На машине должен стоять ansible
Перехоим в каталог /foo-lesson.9
Запускаем vagrant up
подниметься 2 машины с nginx на 8080 портах

ansible-playbook test.yml --connection=ssh --user=zigota --private-key=/home/zigota/.ssh/id_rsa
