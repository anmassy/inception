all: build run

data:
	@if [ ! -d "home/anmassy/data/mariadb;" ] && [ ! -d "home/anmassy/data/wordpress;" ]; then \
	mkdir -p home/anmassy/data/mariadb && mkdir -p home/anmassy/data/wordpress; fi

build: data
	docker-compose -f srcs/docker-compose.yml build

run:
	docker-compose -f srcs/docker-compose.yml up -d

vclean :
	docker compose -f srcs/docker-compose.yml down --rmi all -v
	@sudo rm -rf home

fclean : vclean
	docker system prune -af
