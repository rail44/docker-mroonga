FROM bradrydzewski/mysql:5.5
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN add-apt-repository -y ppa:groonga/ppa
RUN apt-get update
RUN apt-get install -y groonga groonga-normalizer-mysql groonga-tokenizer-mecab
