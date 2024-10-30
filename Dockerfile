# Используем базовый образ Golang
FROM golang:1.18-alpine AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы и устанавливаем зависимости
COPY . .

# Сборка приложения
RUN go build -o redpanda-console

# Используем легковесный образ для финального контейнера
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/redpanda-console .

# Открываем порт для приложения
EXPOSE 8080

# Запускаем приложение
CMD ["./redpanda-console"]
