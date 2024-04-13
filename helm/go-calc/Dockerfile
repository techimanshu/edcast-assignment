FROM golang:1.21.1-alpine3.18 AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build -mod=mod -o go-calc .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/go-calc .

EXPOSE 8080

CMD ["./go-calc"]

