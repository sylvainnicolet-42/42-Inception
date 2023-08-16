# Get variables from .env file
include ./srcs/.env

DOCKER_COMPOSE = ./srcs/docker-compose.yml

all: build

build:	create_volumes
		docker-compose  -f ${DOCKER_COMPOSE} -p inception up --build -d

create_volumes:
	mkdir -p $(WP_VOLUME_PATH)
	mkdir -p $(DB_VOLUME_PATH)