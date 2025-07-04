# syntax=docker/dockerfile:1

FROM --platform=$BUILDPLATFORM golang:1.20 AS builder
WORKDIR /src

# cache dependencies
COPY go.mod ./
# download dependencies (go.sum will be generated if needed)
RUN go mod download

# copy source
COPY . .

ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /app/linacc ./cmd/server

FROM --platform=$TARGETPLATFORM alpine:latest
WORKDIR /app
COPY --from=builder /app/linacc ./linacc
COPY --from=builder /src/web ./web
EXPOSE 8080
CMD ["./linacc"]
