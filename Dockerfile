FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu
MAINTAINER 32283@kyowon.co.kr

RUN apt-get update
RUN apt-get install curl wget -y

RUN echo "yes" | apt-get upgrade -y

RUN ls /opt/mssql-tools/bin/sqlcmd*
RUN ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd

WORKDIR /home/docker-container/mssql