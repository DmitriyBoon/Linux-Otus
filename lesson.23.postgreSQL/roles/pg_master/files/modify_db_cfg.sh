#!/bin/bash

# update config files
sed -Ei 's/#listen_addresses/listen_addresses/g' /var/lib/pgsql/9.6/data/postgresql.conf
sed -Ei 's/localhost/*/g' /var/lib/pgsql/9.6/data/postgresql.conf

sudo systemctl stop postgresql-9.6.service
sudo systemctl start postgresql-9.6.service

# TODO varibalize
echo 'host replication replicador 0.0.0.0/0 trust' >> /var/lib/pgsql/9.6/data/pg_hba.conf

sudo systemctl stop postgresql-9.6.service
sudo systemctl start postgresql-9.6.service