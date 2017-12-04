FROM ubuntu:latest
MAINTAINER You "droly@student.42.fr"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y apache2 php5 php5-gd php-xml-parser php5-intl php5-sqlite smbclient curl libcurl3 php5-curl bzip2 wget vim

#RUN wget -O - http://download.owncloud.org/community/owncloud-5.0.7.tar.bz2 | tar jx -C /var/www/
RUN wget -nv https://download.owncloud.org/download/repositories/production/Ubuntu_17.04/Release.key -O Release.key \
&& apt-key add - < Release.key
RUN echo 'deb http://download.owncloud.org/download/repositories/production/Ubuntu_17.04/ /' > /etc/apt/sources.list.d/owncloud.list \
&& apt-get update
RUN apt-get install owncloud-files
RUN chown -R www-data:www-data /var/www/owncloud

ADD ./001-owncloud.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/001-owncloud.conf /etc/apache2/sites-enabled/
RUN a2enmod rewrite

EXPOSE :80

CMD ["/usr/sbin/apache2ctl", "-D",  "FOREGROUND"]
