#!/bin/bash
. ../.env
cd ..

docker-compose exec mysql bash -c 'mysql -uroot -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}'