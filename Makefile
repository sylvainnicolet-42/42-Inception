# Get variables from .env file
include ./srcs/.env

DOCKER_COMPOSE = ./srcs/docker-compose.yml

all: build

build:
		docker-compose -f ${DOCKER_COMPOSE} -p inception up --build -d

up:
		docker-compose -f ${DOCKER_COMPOSE} -p inception up -d

down:
		docker-compose -f ${DOCKER_COMPOSE} -p inception down

create_data:
	mkdir -p $(VOLUMES_PATH)/wordpress
	mkdir -p $(VOLUMES_PATH)/mysql

delete_data:
	rm -rf $(VOLUMES_PATH)

clean_data: delete_data create_data

purge:
	docker image prune -f -a

purge_volumes:
	docker volume rm wp_volume
	docker volume rm db_volume

fclean: purge purge_volumes clean_data

nginx:
	docker exec -it nginx bash

wordpress:
	docker exec -it wordpress bash

mariadb:
	docker exec -it mariadb bash

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "up: Runs the containers"
	@echo "build: Builds and run the containers"
	@echo "down: Stops and removes the containers"
	@echo "clean_data: Deletes and create data folders"
	@echo "create_data: Creates data folders"
	@echo "delete_data: Deletes data folders"
	@echo "purge: Deletes all images"
	@echo "purge_volumes: Deletes all volumes"
	@echo "fclean: Deletes all images and data folders"
	@echo "nginx: Access to nginx container"
	@echo "wordpress: Access to wordpress container"
	@echo "mariadb: Access to mariadb container"
