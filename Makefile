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
	cd commands && bash mysql.sh

# アプリの作成と初期化
create:
	cd commands && bash create.sh

# authのインストール
auth:
	docker-compose exec app composer require laravel/ui
	docker-compose exec app php artisan ui vue --auth
	docker-compose exec node npm install
	docker-compose exec node npm run dev
	docker-compose exec -d node npm run watch-poll

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

