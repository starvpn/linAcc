# syntax=docker/dockerfile:1

FROM golang:1.20 AS builder
WORKDIR /src

# cache dependencies
COPY go.mod ./
# copy go.sum if present
COPY go.sum ./
RUN go mod download

# copy source
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /app/linacc ./cmd/server

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/linacc ./linacc
COPY --from=builder /src/web ./web
EXPOSE 8080
CMD ["./linacc"]
