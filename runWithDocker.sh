#!/bin/bash

docker stop webgeold
docker rm webgeold
docker run -d --name webgeold -p 80:80 webgeold
