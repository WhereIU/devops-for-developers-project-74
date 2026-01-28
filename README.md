### Hexlet tests and linter status:
[![Actions Status](https://github.com/WhereIU/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/WhereIU/devops-for-developers-project-74/actions)

### CI/CD status
![CI/CD Status](https://github.com/WhereIU/devops-for-developers-project-74/workflows/CI/CD/badge.svg)

Образ доступен на DockerHub: voracitymajo/devops-for-developers-project-74

## Описание проекта

DevOps проект для развертывания Fastify блога с использованием Docker, Docker Compose, Caddy и CI/CD.

## Требования к системе

- Docker 20.10+
- Docker Compose 2.0+
- Make

## Установка и запуск

1. Клонируйте репозиторий:
```bash
git clone https://github.com/WhereIU/devops-for-developers-project-74.git
cd devops-for-developers-project-
```

2. Настройте переменные окружения:

```bash
cp .env.example .env
# Отредактируйте .env при необходимости
```

3. Запустите проект:
```bash
make setup    # Первоначальная настройка
make dev      # Запуск в режиме разработки
Откройте в браузере: http://localhost
```

4. Тестирование
```bash
make test     # Запуск тестов
```