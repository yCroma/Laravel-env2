# Laravel-env2
Laravelの開発環境が立ち上げられます。

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
