FROM golang:1.10-alpine3.7 as builder
WORKDIR /circleCI-workshop/main
COPY . .
RUN go get -d ./... && go build -o main .

FROM alpine:3.8
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /circleCI-workshop/main .

EXPOSE 8080
ENTRYPOINT ./main