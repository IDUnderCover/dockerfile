FROM mysql/mysql-server
MAINTAINER ZETTAGE

ENV MYSQL_ROOT_PASSWORD zettage
ENV MYSQL_DATABASE guac_db
 
ADD $PWD/initdb.sql /docker-entrypoint-initdb.d/inidb.sql


