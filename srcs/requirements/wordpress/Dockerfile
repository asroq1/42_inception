FROM debian:buster

RUN  apt-get update && \
	apt-get -y install wget tar sudo php7.3-fpm php7.3-mysql mariadb-client

COPY /tools/setting.sh /
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/

RUN mkdir -p /run/php && \
	chmod +x /setting.sh


EXPOSE 9000


ENTRYPOINT [ "sh", "-c", "/setting.sh" ]

