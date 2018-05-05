# Build Image
FROM golang:1.10-alpine3.7 AS build
RUN apk add --no-cache git vim
RUN go get github.com/golang/dep/cmd/dep
WORKDIR /go/src/github.com/caladoj/go-hello
COPY Gopkg.* ./
RUN dep ensure -vendor-only
COPY *.go ./
RUN go install

# Runtime Image
FROM alpine:3.7
COPY --from=build /go/bin/go-hello /go/bin/
ENTRYPOINT ["/go/bin/go-hello"]
EXPOSE 80
