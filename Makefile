
COMPOSE_FILE=./srcs/docker-compose.yml

all: run

run: 
	@sudo mkdir -p /home/bfaisy/data/wordpress
	@sudo mkdir -p /home/bfaisy/data/mysql
	@docker-compose -f $(COMPOSE_FILE) up --build

clean: 	
	@docker-compose -f $(COMPOSE_FILE) down
	@-docker stop `docker ps -qa`
	@-docker rm `docker ps -qa`
	@-docker rmi -f `docker images -qa`
	@-docker volume rm `docker volume ls -q`
	@-docker network rm `docker network ls -q`
	@sudo rm -rf /home/bfaisy/data/wordpress
	@sudo rm -rf /home/bfaisy/data/mysql

.PHONY: run up debug list list_volumes clean
