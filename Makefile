# Get variables from .env file
include ./srcs/.env

DOCKER_COMPOSE = ./srcs/docker-compose.yml

all: up

up:
		docker-compose -f ${DOCKER_COMPOSE} -p inception up -d

build:
		docker-compose -f ${DOCKER_COMPOSE} -p inception up --build -d

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
	docker volume rm inception_wordpress
	docker volume rm inception_mariadb

fclean: purge purge_volumes clean_data

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
	@echo "help: Shows help"