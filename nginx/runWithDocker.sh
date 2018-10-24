#!/bin/bash

docker stop nginx
docker rm nginx
docker run -d --name nginx -p 80:80 -v volnginx:/etc/nginx/conf.d nginx
docker cp default.conf nginx:/etc/nginx/conf.d/
docker cp nginx.conf nginx:/etc/nginx/
docker restart nginx
