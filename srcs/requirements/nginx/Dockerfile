FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get -y install nginx openssl vim

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/setting.sh /var/www

RUN chmod +x /var/www/setting.sh

EXPOSE 443

ENTRYPOINT [ "/var/www/setting.sh" ]

RUN	chown -R www-data:www-data /var/lib/nginx
CMD [ "nginx", "-g", "daemon off;" ]