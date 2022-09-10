FROM golang:1.18 AS builder

WORKDIR /app

COPY hello.go ./

RUN go mod init example/hello
RUN go build -o hello


FROM scratch

WORKDIR /app

COPY --from=builder /app/hello /hello

EXPOSE 8080

ENTRYPOINT ["/hello"]  