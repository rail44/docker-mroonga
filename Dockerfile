FROM bradrydzewski/mysql:5.5
ADD ./sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --allow-unauthenticated groonga-keyring
RUN apt-get update
RUN apt-get install -y mysql-server-mroonga groonga-normalizer-mysql groonga-tokenizer-mecab
