FROM ubuntu

RUN apt-get update && \
    apt-get install -y emacs-nox git && \
    echo mysql-server mysql-server/root_password password root | debconf-set-selections && \
    echo mysql-server mysql-server/root_password_again password root | debconf-set-selections && \
    apt-get install -y mysql-client mysql-server && \
    apt-get install -y apache2  php7.0 libapache2-mod-php7.0 && \
    apt-get install -y graphviz aspell php7.0-pspell php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-ldap php7.0-zip php7.0-mbstring php7.0-soap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cd /opt && \
    git clone git://git.moodle.org/moodle.git

RUN cd /opt/moodle && \
    git branch --track MOODLE_32_STABLE origin/MOODLE_32_STABLE &&\
    git checkout MOODLE_32_STABLE

RUN cp -R /opt/moodle /var/www/html/ && \
    mkdir /var/moodledata && \
    chown -R www-data /var/moodledata && \
    chmod -R 777 /var/moodledata && \
    chmod -R 0755 /var/www

COPY mysqld.cnf /etc/mysql/conf.d/mysqld.cnf
COPY entrypoint.sh /entrypoint.sh
COPY config.php /var/www/html/moodle/config.php
