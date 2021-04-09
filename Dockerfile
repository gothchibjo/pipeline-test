FROM golang:latest AS builder

LABEL maintainer="Maxim Maximov <max@mxmv.ru>"

ARG VERSION=dev

# Set the Current Working Directory inside the container
WORKDIR /go/src/app

# # Copy go mod and sum files
# COPY go.mod go.sum ./

# # Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
# RUN go mod download

COPY main.go .

RUN go build -o main -ldflags=-X=main.version=${VERSION} main.go

FROM scratch

COPY --from=builder /go/src/app/main /go/bin/main

ENV PATH="/go/bin:${PATH}"

CMD ["main"]