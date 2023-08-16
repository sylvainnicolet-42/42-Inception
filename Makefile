# Get variables from .env file
include ./srcs/.env

DOCKER_COMPOSE = ./srcs/docker-compose.yml

all: up

up:		create_volumes
		docker-compose -f ${DOCKER_COMPOSE} -p inception up -d

build:	create_volumes
		docker-compose -f ${DOCKER_COMPOSE} -p inception up --build -d

down:
		docker-compose -f ${DOCKER_COMPOSE} -p inception down

create_volumes:
	mkdir -p $(VOLUMES_PATH)/wordpress
	mkdir -p $(VOLUMES_PATH)/mysql

delete_volumes:
	docker volume rm inception_wordpress
	docker volume rm inception_mariadb
	rm -rf $(VOLUMES_PATH)

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "up: Runs the containers"
	@echo "build: Builds and run the containers"
	@echo "down: Stops and removes the containers"
	@echo "create_volumes: Creates the volumes"
	@echo "delete_volumes: Deletes the volumes"
	@echo "help: Shows help"
	@echo ""