#!/bin/bash

#docker stop graphdb
#docker rm graphdb
docker run -d --name graphdb -p 7200:7200   -v graphdbvol2:/graphdb/data graphdb-free
#docker cp graphdb.properties nginx_graphdb_1:/graphdb/conf
#docker restart  nginx_graphdb_1
