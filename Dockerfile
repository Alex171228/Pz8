# ===== Build stage =====
FROM golang:1.22 AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download || true
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /bin/api ./cmd/api

# ===== Runtime stage =====
FROM gcr.io/distroless/base-debian12:nonroot
WORKDIR /
COPY --from=build /bin/api /bin/api
ENV GIN_MODE=release
EXPOSE 8080
USER nonroot:nonroot
ENTRYPOINT ["/bin/api"]
