#!/bin/bash
echo "hello"
# this will setup the master
# inti pg
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl enable postgresql-9.6.service
sudo systemctl enable postgresql-9.6.service
sudo systemctl start postgresql-9.6.service

# create replication
sudo su
su postgres
psql -c 'create user replicador replication;'
# psql -U postgres -c "create user bob replication"
# you have to figure out how this works from bash ^
exit

# other try:
#!/bin/sh
echo "hello"

sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl enable postgresql-9.6.service
sudo systemctl enable postgresql-9.6.service
sudo systemctl start postgresql-9.6.service

sudo -u postgres -H -- psql -c "create user replicador replication;"
#end other try




# update config files
sed -Ei 's/#listen_addresses/listen_addresses/g' /var/lib/pgsql/9.6/data/postgresql.conf
sed -Ei 's/localhost/*/g' /var/lib/pgsql/9.6/data/postgresql.conf

sudo systemctl stop postgresql-9.6.service
sudo systemctl start postgresql-9.6.service

# TODO varibalize
echo 'host replication replicador 192.168.255.0/24 trust' >> /var/lib/pgsql/9.6/data/pg_hba.conf
