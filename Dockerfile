FROM golang:alpine

ADD /main.go  /go/src/main/
ADD /strings.go  /go/src/main/
ADD /strings_test.go  /go/src/main/
ADD /temp.html  /go/src/main/
RUN go get ./src/main
RUN go install main
ENTRYPOINT /go/bin/main
EXPOSE 8080