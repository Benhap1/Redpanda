# Используйте официальный образ Golang
FROM golang:1.17

# Установите рабочую директорию
WORKDIR /app

# Копируем все файлы проекта
COPY . .

# Скомпилируйте приложение
RUN go build -o redpanda-console .

# Укажите команду для запуска приложения
CMD ["./redpanda-console"]
