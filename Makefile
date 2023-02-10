
# --build : doesn't matter about cached data. it must rebuild the source

all : 
	sudo mkdir -p /home/hyunjung/data/wordpress
	sudo mkdir -p /home/hyunjung/data//mariadb

	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d
	
re : 
	sudo docker-compose build ./srcs/docker-compose.yml --no-cache

clean : 
		sudo docker-compose -f ./srcs/docker-compose.yml down
		sudo docker system prune -a
		sudo rm -rf /home/hyunjung/data
		sudo docker volume rm srcs_database-volume
		sudo docker volume rm srcs_wordpress-volume

.PHONY : all re clean 