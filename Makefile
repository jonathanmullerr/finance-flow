CONTAINER_NAME = sportify

.PHONY: shell run stop clean

build: 
	docker compose up --build

bash:
	docker exec -it $(CONTAINER_NAME) /bin/bash

command:
	docker exec -it $(CONTAINER_NAME) $(cmd)

stop:
	docker stop $(CONTAINER_NAME)

clean:
	docker rm $(CONTAINER_NAME)

bundle:
	docker compose run web bundle install

migrate:
	docker compose run web rails db:migrate

create: 
	docker compose run web rails db:create

seed:
	docker compose run web rails db:seed

setup:
	docker compose run web rails db:setup

run: 
	docker compose up

down:
	docker compose down