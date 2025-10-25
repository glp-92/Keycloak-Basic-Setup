#!/bin/bash

# export ENV_FILE=./.env
# mkdir ./mysql/initdb
# bash ./mysql/generate_initdb.sh

source ${ENV_FILE}

cat <<EOF > ./backend/mysql/initdb/init.sql
CREATE USER IF NOT EXISTS '${KEYCLOAK_MYSQL_USER}'@'%' IDENTIFIED WITH 'caching_sha2_password' BY '${KEYCLOAK_MYSQL_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${KEYCLOAK_DATABASE} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON keycloak.* TO '${KEYCLOAK_MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF