FROM debian:buster

RUN  apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y mariadb-server  mariadb-client

ENV MYSQL_ALLOW_EMPTY_PASSWORD=no
ENV DOMAIN_NAME=hyunjung.42.fr
ENV MYSQL_DB=wordpress_db
ENV MYSQL_USER=asroq1
ENV MYSQL_PW=1234
ENV MYSQL_ROOT=root
ENV MYSQL_ROOT_PW=1234
ENV WP_USER=hyunjung
ENV WP_EMAIL=asroq98@gmail.com
ENV WP_PASS=1234
ENV WP_TITLE=inception
ENV WP_ADMIN=root
ENV WP_ADMIN_PW=1234
ENV WP_ADMIN_EMAIL=hyunjung@student.42seoul.kr

# 50-server.cnf에서 bind-adress주소를 주석처리 해주는 파일로 덮어씌운다.
# 안 해주는 경우에는 외부 ip에서 접근할 수 없기 때문에
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN set -ex ; \
	service mysql start ; \
	echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};" > /root/init_db.sql ; \ 
	echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PW}';" >> /root/init_db.sql ; \
	echo "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%';" >> /root/init_db.sql ; \
	echo "FLUSH PRIVILEGES;" >> /root/init_db.sql ; \
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PW}';" >> /root/init_db.sql ; \
	mysql -hlocalhost -u root -p${MYSQL_ROOT_PW} -e "source /root/init_db.sql;" && \
	rm /root/init_db.sql


EXPOSE 3306 
CMD [ "mysqld" ]
