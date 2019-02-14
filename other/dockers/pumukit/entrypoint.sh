mongod -f /etc/mongod.conf --smallfiles &
service nginx start
service php5-fpm start
