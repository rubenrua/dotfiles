FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y emacs-nox git && \
    echo mysql-server mysql-server/root_password password root | debconf-set-selections && \
    echo mysql-server mysql-server/root_password_again password root | debconf-set-selections && \
    apt-get install -y mysql-client mysql-server && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2  php libapache2-mod-php && \
    apt-get install -y graphviz aspell php-pspell php-curl php-gd php-intl php-mysql php-xml php-xmlrpc php-ldap php-zip php-mbstring php-soap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cd /opt && \
    git clone git://git.moodle.org/moodle.git

RUN cd /opt/moodle && \
    git branch --track MOODLE_35_STABLE origin/MOODLE_35_STABLE &&\
    git checkout MOODLE_35_STABLE

RUN cp -R /opt/moodle /var/www/html/ && \
    mkdir /var/moodledata && \
    chown -R www-data /var/moodledata && \
    chmod -R 777 /var/moodledata && \
    chmod -R 0755 /var/www

COPY mysqld.cnf /etc/mysql/conf.d/mysqld.cnf
COPY entrypoint.sh /entrypoint.sh
COPY config.php /var/www/html/moodle/config.php
