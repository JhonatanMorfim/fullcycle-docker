FROM golang:alpine AS builder
WORKDIR /
COPY ./main.go /
ENV CGO_ENABLED=0
RUN go build -ldflags="-s -w" -o main ./main.go
FROM scratch
WORKDIR /app
COPY --from=builder /main .
CMD ["./main"]