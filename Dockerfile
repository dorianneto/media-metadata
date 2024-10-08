FROM golang:1.23.1-alpine

RUN apk update
RUN apk upgrade
RUN apk add --no-cache ffmpeg

RUN go install github.com/air-verse/air@latest

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download
COPY . .

EXPOSE 8000

CMD ["air"]
