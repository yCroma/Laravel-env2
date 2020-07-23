#!/bin/bash
. ../.env
cd ..

docker-compose up -d
docker-compose exec -w /var/www/html app laravel new ${APP_NAME} --force
docker-compose exec app mkdir -p storage/framework/cache/data
docker-compose exec app mkdir -p storage/framework/sessions
docker-compose exec app mkdir -p storage/framework/views
docker-compose exec app chmod 777 -R storage
docker-compose exec app composer update

docker-compose exec app php artisan key:generate	