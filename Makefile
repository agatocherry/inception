# Variables

NAME			= Inception
SRCS 			= ./srcs
DOCKER			= sudo docker
COMPOSE 		= cd srcs/ && sudo docker-compose
DATA_PATH 		= /home/agcolas/data

# Color variables

RED				= \033[0;31m
PURPLE			= \033[0;35m
NC				= \033[0m		# No Color

# Rules

all		:	build
			@sudo mkdir -p $(DATA_PATH)
			@sudo mkdir -p $(DATA_PATH)/wordpress
			@sudo mkdir -p $(DATA_PATH)/database
			@sudo chmod 777 /etc/hosts
			@sudo echo "127.0.0.1 agcolas.42.fr" >> /etc/hosts
			@sudo echo "127.0.0.1 www.agcolas.42.fr" >> /etc/hosts
			@$(COMPOSE) up -d
			@echo "${PURPLE}🌸 Build complete ${NC}"

build	:
			@$(COMPOSE) build

up:
			@${COMPOSE} up -d 

check:
			@echo "${PURPLE}🌸 Docker services :${NC}"
			@cd $(SRCS) && sudo docker-compose ps 
			@echo ""
			@echo "${PURPLE}🌸 Docker network :${NC}"
			@cd $(SRCS) && sudo docker network ls

down	:
			@$(COMPOSE) down

clean	:
			@$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
			@$(DOCKER) system prune --volumes --all --force
			@sudo rm -rf $(DATA_PATH)
			@$(DOCKER) network prune --force
			@echo docker volume rm $(docker volume ls -q)
			@$(DOCKER) image prune --force
			@echo "${RED}⚠️ $(NAME) is delete.${NC}"

re		:	fclean all

.PHONY : all build up check down clean fclean re