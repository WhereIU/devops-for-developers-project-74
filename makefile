.PHONY: init setup build login push run-local dev start stop clean console

DOCKER_COMPOSE := $(shell command -v docker-compose 2>/dev/null || echo "docker compose")
DOCKER_HUB_USERNAME := voracitymajo
IMAGE_NAME := $(DOCKER_HUB_USERNAME)/devops-for-developers-project-74

init:
	@if [ ! -d "app" ]; then \
		git clone git@github.com:hexlet-components/js-fastify-blog.git app; \
		rm -rf app/.git; \
	fi

setup: init
	$(DOCKER_COMPOSE) run --rm app make setup

build:
	$(DOCKER_COMPOSE) -f docker-compose.yml build app

login:
	docker login

push: build
	$(DOCKER_COMPOSE) -f docker-compose.yml push app

run-local:
	docker run -p 8080:8080 -e NODE_ENV=development $(IMAGE_NAME) make dev

dev:
	$(DOCKER_COMPOSE) up

test:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

start:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

stop:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down -v
	docker system prune -f
	rm -rf app/
	
ci-test: test

ci-build:
	docker build -f Dockerfile.production -t $(IMAGE_NAME):latest .

ci-push: ci-build
	docker push $(IMAGE_NAME):latest

ci: ci-test ci-build ci-push

