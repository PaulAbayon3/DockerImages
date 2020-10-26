# Provision a secure & fast WordPress server with Nginx/MariaDB/PHP7.2 environment

# Download & update Ubuntu 18.04, install Nginx & other dependencies
FROM ubuntu:18.04
MAINTAINER PaulAbayon3
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install nginx nano wget tar -y

# # Setup PHP 7.2-FPM
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update
RUN apt install php7.2-fpm php7.2-common php7.2-curl php7.2-intl php7.2-mbstring php7.2-xmlrpc php7.2-mysql php7.2-gd p$ADD php.ini /etc/php/7.2/fpm/php.ini

# Download & setup the WordPress site in home directory
RUN cd /tmp
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
RUN mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
ADD wordpress /etc/nginx/sites-available/