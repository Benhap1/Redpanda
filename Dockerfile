FROM golang:1.17 AS build
WORKDIR /app

# Копируем модульные файлы и загружаем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем весь проект и выполняем сборку
COPY . .
RUN go build -o redpanda-console

# Создаем минимальный образ для запуска
FROM alpine:latest
WORKDIR /app
COPY --from=build /app/redpanda-console /app/

CMD ["./redpanda-console"]
