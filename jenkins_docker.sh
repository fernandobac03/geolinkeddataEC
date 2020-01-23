#!/bin/sh

#source https://hub.docker.com/_/jenkins/

#docker pull jenkins/jenkins:lts

#con proxy, nginx
#docker run -d --name jenkins -p 8080:8080 -p 50000:50000 --env JENKINS_OPTS="--prefix=/jenkins" -v /home/dticalidad/jenkins_home:/var/jenkins_home jenkins/jenkins:lts

#directo
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /home/dticalidad/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
