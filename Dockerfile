FROM ubuntu:trusty
ADD ./sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --allow-unauthenticated groonga-keyring
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mysql-server
RUN mysqld & \
    apt-get install -y mysql-server-mroonga groonga-normalizer-mysql groonga-tokenizer-mecab &&\
    mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '';" &&\
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
ADD ./my.cnf /etc/mysql/conf.d/my.cnf

EXPOSE 3306
CMD mysqld
