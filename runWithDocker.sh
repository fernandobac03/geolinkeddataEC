#!/bin/bash

docker stop webgeold
docker rm webgeold
docker run -d --name webgeold -p 8081:8081 webgeold
