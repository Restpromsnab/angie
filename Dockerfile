# Используем официальный образ Angie как базовый
FROM docker.angie.software/angie:latest

# Копируем ваш кастомный конфиг angie.conf в контейнер
# Предполагается, что файл angie.conf лежит рядом с Dockerfile
COPY ./angie.conf /etc/angie/angie.conf

# Убеждаемся, что конфиг будет читаться только для чтения (по аналогии с compose)
# Не обязательно, но полезно для безопасности
RUN chmod 644 /etc/angie/angie.conf

# Указываем, что контейнер должен запускаться в foreground режиме
CMD ["angie", "-g", "daemon off;"]