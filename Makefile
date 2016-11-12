THIS_FILE := $(lastword $(MAKEFILE_LIST))
	
PROJECT_NAME := boilerplate

.DEFAULT_GOAL := help
	
help:	
	@echo "help            Print this help"
	@echo "build           Build docker environment"
	@echo "up              Start docker stack"
	@echo "down            Stop docker stack"
	@echo "restart         Restart docker stack"
	@echo "attach          Start a shell"

.PHONY: help build up down restart attach

build:
	@docker-compose stop
	@docker-compose rm -f
	@docker-compose pull
	@docker-compose build
	@docker-compose up db

up:
	@docker-compose up -d
	@docker-compose logs -f

down:
	@docker-compose stop

restart:
	@docker-compose restart
	@docker-compose logs

attach:
	@if ! docker-compose ps | grep $(PROJECT_NAME)_web_1 | grep 'Up' > /dev/null 2>&1; then $(MAKE) -f $(THIS_FILE) up; false; fi
	@docker exec -it $(PROJECT_NAME)_web_1 bash

web_logs:
	@docker logs -f $(PROJECT_NAME)_web_1

ps:
	@docker-compose ps
