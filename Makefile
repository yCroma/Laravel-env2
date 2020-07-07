# アプリ名
APP_NAME=application
APP_GROUP=test
MYSQL_PASSWORD=secret
MYSQL_DATABASE=homestead

# docker関連
build:
	docker-compose build

up:
	docker-compose up -d

ps:
	docker-compose ps

restart:
	docker-compose restart

down:
	docker-compose down

delete:
	docker-compose down --rmi all --volumes

# コンテナへの入り方
web:
	docker-compose exec web ash

app:
	docker-compose exec app ash

node:
	docker-compose exec node ash

mysql:
	docker-compose exec mysql bash -c 'mysql -uroot -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE)'

# アプリの作成と初期化
create:
	docker-compose run -w /var/www/html app laravel new $(APP_NAME) --force
	docker-compose run app mkdir -p storage/framework/cache/data
	docker-compose run app mkdir -p storage/framework/sessions
	docker-compose run app mkdir -p storage/framework/views
	docker-compose run app chmod 777 -R storage
	@make up
	@make restart
	docker cp ./docker/php/.env $(APP_GROUP)_app:/var/www/html/application/.env
	docker-compose run app php artisan key:generate	

# npm watch
npm-watch:
	docker-compose exec -d node npm run watch-poll

# vue-init
vue-init:
	docker-compose exec app composer require laravel/ui
	docker-compose exec app php artisan ui vue
	docker-compose exec node npm install
	docker-compose exec node npm run dev
	docker-compose exec -d node npm run watch-poll

# migration
migrate:
	docker-compose exec app php artisan migrate

