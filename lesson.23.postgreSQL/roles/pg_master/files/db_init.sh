#!/bin/bash
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl enable postgresql-9.6.service
sudo systemctl enable postgresql-9.6.service
sudo systemctl start postgresql-9.6.service