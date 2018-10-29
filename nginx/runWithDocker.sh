#!/bin/bash

#docker stop nginx
#docker rm nginx
#docker run -d --name nginx -p 80:80 -v volnginx:/etc/nginx/conf.d nginx
docker cp default.conf nginx_nginx_1:/etc/nginx/conf.d/
docker cp nginx.conf nginx_nginx_1:/etc/nginx/
docker restart nginx_nginx_1
