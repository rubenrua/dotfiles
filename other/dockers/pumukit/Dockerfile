FROM ubuntu:14.04

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    apt-get update && \
    apt-get install -y emacs24-nox git && \
    apt-get install -y git curl nginx-full && \
    apt-get install -y php5-fpm php5-cli php5-curl php5-intl php5-json && \
    apt-get install -y php5-intl php5-xdebug php5-curl php5-ldap && \
    apt-get install -y mongodb-org php5-mongo && \
    apt-get install -y libav-tools libavcodec-extra && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin/ && \
    php -r "unlink('composer-setup.php');"


RUN mkdir /var/www && \
    cd /var/www && \
    git clone https://github.com/campusdomar/PuMuKIT2.git pumukit && \
    cd pumukit && \
    git checkout 2.3.x


#RUN cd /var/www/pumukit && \
#   composer.phar install

COPY entrypoint.sh /entrypoint.sh