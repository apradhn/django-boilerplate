#!/bin/sh

set -e

# Perform all actions as user 'postgres'
export PGUSER=postgres

# Set environment
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=postgres
DB_ENCODING=UTF-8
DB_PG_DUMP_FILE=/tmp/db/db.pgdump

if [ -f $DB_PG_DUMP_FILE ]; then
    echo "Populating Database"
    pg_restore --dbname $DB_NAME $DB_PG_DUMP_FILE
fi

# Create the database
psql <<EOSQL
CREATE USER "$DB_USER" WITH PASSWORD '$DB_PASSWORD' CREATEDB;
CREATE DATABASE "$DB_NAME" WITH OWNER="$DB_USER" TEMPLATE=template0 ENCODING='$DB_ENCODING';
EOSQL

# Populate database
# pg_restore --dbname $DB_NAME $DB_PG_DUMP_FILE

set_listen_addresses='*'

echo
echo 'PostgreSQL init process complete; ready for start up.'
echo

exit
