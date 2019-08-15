FROM golang:1.10-alpine3.7 as builder
WORKDIR /go/src/go-endava/main
COPY . .
RUN go get -d ./... && go build -o main .

FROM alpine:3.8
RUN apk update
RUN apk --no-cache add ca-certificates
RUN apk add git
WORKDIR /root/
COPY --from=builder /go/src/go-endava/main .

EXPOSE 8080
ENTRYPOINT ./main