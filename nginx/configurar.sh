#!/bin/bash


docker-compose exec site jekyll build
docker cp default.conf nginx_nginx_1:/etc/nginx/conf.d/
docker cp nginx.conf nginx_nginx_1:/etc/nginx/
docker restart nginx_nginx_1
sudo docker cp ../graphdb/graphdb.properties nginx_graphdb_1:/graphdb/conf
docker restart nginx_graphdb_1
