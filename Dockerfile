FROM debian:latest
MAINTAINER Fernando Baculima


# Install required packages

ENV TOMCATVER 7.0.73

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get -q -y update && apt-get -q -y upgrade && apt-get -q -y install \ 
				libcups2 \
				nano \
				wget \
				python-dev \
				libpq-dev \
				unzip \ 
				&& apt-get -q clean

RUN ( apt-get update && DEBIAN_FRONTEND=noninteractive apt install -y -t jessie-backports  openjdk-8-jre-headless ca-certificates-java)

RUN (wget -O /tmp/tomcat7.tar.gz http://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz && \
  cd /opt && \
  tar zxf /tmp/tomcat7.tar.gz && \
  mv /opt/apache-tomcat* /opt/tomcat && \
  rm /tmp/tomcat7.tar.gz)

### to deploy a specific war to ROOT, uncomment the following 2 lines and specify the appropriate .war
RUN rm -rf  /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
RUN mkdir /opt/tomcat/webapps/ROOT 
ADD / /opt/tomcat/webapps/ROOT/

#####################################
###download and install parliament###
#####################################

#RUN mkdir /opt/tomcat/bin/parliament
#RUN mkdir /ParliamentKB
#RUN wget -P /ParliamentKB/ http://semwebcentral.org/frs/download.php/555/ParliamentQuickStart-v2.7.10-gcc-64-ubuntu-15.10.zip
#RUN unzip /ParliamentKB/ParliamentQuickStart-v2.7.10-gcc-64-ubuntu-15.10.zip -d /opt/tomcat/bin/parliament
#RUN chown -R root:root /opt/tomcat/bin/parliament

#RUN sed 's/kbDirectoryPath=./kbDirectoryPath=data/g' /opt/tomcat/bin/parliament/ParliamentConfig.txt > newparliamentconfig.txt
#RUN mv newparliamentconfig.txt /opt/tomcat/bin/parliament/ParliamentConfig.txt
#RUN cp /opt/tomcat/bin/parliament/bin/*.* /opt/tomcat/bin/parliament/

#RUN cp /opt/tomcat/bin/parliament/webapps/parliament.war /opt/tomcat/webapps/

#ADD /parliament/setenv.sh /opt/tomcat/bin

############################
###end install parliament###
############################

#Changing default tomcat port
RUN sed 's/8080/8081/g' /opt/tomcat/conf/server.xml > newserver.xml
RUN mv newserver.xml /opt/tomcat/conf/server.xml


EXPOSE 8081

COPY /start_tomcat.sh /
RUN chmod +x /start_tomcat.sh
CMD ["/start_tomcat.sh"]

