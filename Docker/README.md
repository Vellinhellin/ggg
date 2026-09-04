# 🐳 Docker: Полное руководство

<p align="center">
  <b>История, архитектура, экосистема и практическое применение</b><br>
  <i>От контейнерного "ада зависимостей" к стандарту индустрии</i>
</p>

## 📚 Содержание

1. [Что такое Docker?](#-что-такое-docker)
2. [История появления и развития](#-история-появления-и-развития)
3. [Современное состояние](#-современное-состояние)
4. [Docker Hub и готовые образы](#-docker-hub-и-готовые-образы)
5. [Dockerfile](#-dockerfile)
6. [Docker Compose](#-docker-compose)

---

## 🧐 Что такое Docker?

**Docker** — это платформа для разработки, доставки и запуска приложений в контейнерах. Контейнеры позволяют упаковать приложение со всеми его зависимостями (библиотеки, конфигурации, системные утилиты) в единый легковесный образ, который гарантированно будет работать одинаково на любой системе.

> **Главная идея:** "Build once, run anywhere" (Собрал один раз — запускай где угодно)

### Сравнение контейнеров и виртуальных машин

| Характеристика | Контейнеры (Docker) | Виртуальные машины |
|:---|:---:|:---:|
| **Размер** | Мегабайты (10-100 МБ) | Гигабайты (2-20 ГБ) |
| **Запуск** | Секунды | Минуты |
| **Использование ресурсов** | Минимальное | Высокое (нужна своя ОС) |
| **Изоляция** | На уровне процессов | Полная аппаратная |

---

## 📜 История появления и развития

### До Docker: Проблемы разработки
До 2013 года разработчики сталкивались с проблемой: "На моей машине всё работает, а на сервере — нет!". Причины:
- Разные версии библиотек
- Разные настройки ОС
- Конфликты зависимостей

Виртуальные машины решали проблему изоляции, но были слишком тяжелыми и медленными.

### Рождение Docker (2013)
- **Март 2013:** Компания dotCloud (Соломон Хайкс) представила Docker на конференции PyCon
- **Технологическая основа:** Docker использовал возможности ядра Linux — **cgroups** (ограничение ресурсов) и **namespaces** (изоляция процессов)
- **Главный прорыв:** Docker сделал контейнеры простыми и удобными в использовании

### Развитие по годам
- **2014:** Взрывная популярность, появление Docker Hub
- **2015:** Создание Open Container Initiative (OCI) — стандартизация форматов
- **2016-2018:** Интеграция с Kubernetes, победа в войне оркестраторов
- **2019-н.в.:** Docker становится стандартом де-факто, появление rootless режима, интеграция с облаками

---

## 📈 Современное состояние

Сегодня Docker — это зрелая экосистема:

### Ключевые компоненты
1. **Docker Engine** — основное ядро (демон + CLI)
2. **Docker Desktop** — удобное приложение для Mac/Windows
3. **Docker Hub** — облачный реестр образов
4. **Docker Compose** — инструмент для многоконтейнерных приложений

### Тренды 2023-2025
- Бессерверные контейнеры (AWS Fargate, Google Cloud Run)
- Встроенная безопасность (сканирование уязвимостей)
- Интеграция с CI/CD (GitHub Actions, GitLab CI)
- Rootless режим для повышения безопасности

---

## ☁️ Docker Hub и готовые образы

**Docker Hub** — это крупнейший публичный реестр контейнерных образов. Это как "App Store" для контейнеров.

### Что можно найти на Docker Hub?
- **Официальные образы:** `ubuntu`, `nginx`, `mysql`, `python`, `node` (поддерживаются Docker Inc.)
- **Verified Publisher:** Образы от крупных компаний (Oracle, Microsoft, Elastic)
- **Community:** Любой пользователь может опубликовать свой образ

### Полезные команды
```bash
# Поиск образа
docker search nginx

# Скачать образ
docker pull nginx:alpine

# Загрузить свой образ
docker login
docker tag myapp:latest username/myapp:latest
docker push username/myapp:latest
```

### Альтернативы Docker Hub
- GitHub Container Registry (GHCR)
- GitLab Container Registry
- Amazon ECR, Google Artifact Registry
- Яндекс Container Registry

---

## 📦 Dockerfile

**Dockerfile** — это текстовый файл с инструкциями для сборки образа. Каждая инструкция создает новый слой, который кэшируется для ускорения сборки.

### Основные инструкции

| Инструкция | Описание | Пример |
|:---|:---|:---|
| `FROM` | Базовый образ | `FROM python:3.11-slim` |
| `WORKDIR` | Рабочая директория | `WORKDIR /app` |
| `COPY` | Копирование файлов | `COPY . /app` |
| `RUN` | Выполнение команд при сборке | `RUN pip install -r requirements.txt` |
| `ENV` | Переменные окружения | `ENV DEBUG=false` |
| `EXPOSE` | Указание порта | `EXPOSE 8080` |
| `CMD` | Команда при запуске | `CMD ["python", "app.py"]` |

### Пример простого Dockerfile для Python-приложения

```dockerfile
# Базовый образ
FROM python:3.11-slim

# Установка рабочей директории
WORKDIR /app

# Копирование зависимостей
COPY requirements.txt .

# Установка зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Копирование кода приложения
COPY . .

# Команда запуска
CMD ["python", "app.py"]
```

### Многоступенчатая сборка (для уменьшения размера)

```dockerfile
# Стадия сборки
FROM golang:1.21 AS builder
WORKDIR /src
COPY . .
RUN go build -o /app/myapp .

# Финальный образ
FROM alpine:latest
COPY --from=builder /app/myapp /myapp
CMD ["/myapp"]
```

### Лучшие практики
1. Используйте конкретные теги вместо `latest`
2. Объединяйте команды `RUN` (меньше слоев)
3. Используйте `.dockerignore` для исключения лишних файлов
4. Не запускайте процессы от root
5. Минимизируйте размер образа

---

## 🧩 Docker Compose

**Docker Compose** позволяет запускать многоконтейнерные приложения одной командой. Вместо 5 команд `docker run` вы пишете один YAML-файл.

### Пример `docker-compose.yml` для веб-приложения с БД

```yaml
version: '3.8'

services:
  # Веб-приложение
  web:
    build: .
    ports:
      - "8000:8000"
    environment:
      - DEBUG=true
    depends_on:
      - db
      - redis

  # База данных
  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: secretpassword
      POSTGRES_DB: myapp
    volumes:
      - postgres_data:/var/lib/postgresql/data

  # Кэш
  redis:
    image: redis:alpine

volumes:
  postgres_data:
```

### Основные команды Docker Compose

```bash
# Запустить все сервисы
docker-compose up -d

# Посмотреть логи
docker-compose logs -f web

# Остановить и удалить
docker-compose down

# Пересобрать и запустить
docker-compose up --build

# Выполнить команду внутри контейнера
docker-compose exec web bash

# Посмотреть статус
docker-compose ps
```

### Практический пример: WordPress с MySQL

```yaml
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - ./wp-data:/var/www/html

  db:
    image: mysql:5.7
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
      MYSQL_ROOT_PASSWORD: rootpassword
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

---

## 🔮 Заключение

Docker изменил способ разработки и доставки программного обеспечения. Знание Docker необходимо для современного разработчика и DevOps-инженера.

### Что изучать дальше?
- **Kubernetes** — оркестрация контейнеров в продакшене
- **Docker Swarm** — встроенная оркестрация Docker
- **Безопасность контейнеров** — сканирование уязвимостей, политики безопасности
- **CI/CD с Docker** — автоматическая сборка и деплой

---

## 📚 Полезные ссылки

- [Официальная документация Docker](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Docker Cheat Sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf)
- [Play with Docker](https://labs.play-with-docker.com/) — онлайн-тренажер
> Если вы обнаружили ошибку в этом тексте - сообщите пожалуйста автору!
