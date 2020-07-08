# Laravel-env2
Laravelの開発環境が立ち上げられます。

## Version
```
PHP     7.4.7
Laravel 7.19.0
Node    12.14.1
npm     6.13.4
```

## 注意点
- `.env`のAPP_GROUPを変更する場合、`makefile`内のものを対応させる必要があります
- `makefile`の`APP_NAME`はハードコーディングされてます。変更したい場合、Nginxのconfファイルも対応させる必要があります

## 使い方

```
# アプリ作成
$ make create

# vueの初期化
$ make vue-init

# 各コンテナへの入り方
# nginx
$ make web

# laravel
$ make app

# node
$ make node

# mysql
$ make mysql
```

## ファイル構造

```
.
├── .env
├── Makefile
├── README.md
├── docker
│   ├── nginx
│   │   ├── Dockerfile
│   │   ├── conf.d
│   │   │   └── default.conf
│   │   └── nginx.conf
│   └── php
│       ├── .env
│       ├── Dockerfile
│       └── php_fpm
│           └── php-fpm.d
│               └── zz-docker.conf
└── docker-compose.yml
```
