FROM centos
MAINTAINER sssinsi

# Install dependencies
RUN yum -y update
RUN yum -y install epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# PHP5.6 version
# RUN yum install -y --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd  php-intl php-mysqlnd

# PHP7.0
RUN yum install -y --enablerepo=remi,remi-php70 php php-devel php-mbstring php-pdo php-gd php-intl php-mysqlnd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

# Install app
RUN rm -rf /var/www/html/*
ADD ./cake-sample /var/www/html
RUN cd /var/www/html && /usr/bin/composer install