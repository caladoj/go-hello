# Build Image

FROM golang:1.10-stretch AS build

RUN curl -sS -L -o /go/bin/dep https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 \
    && chmod 755 /go/bin/dep

WORKDIR src/github.com/caladoj/go-hello

COPY *.go .

RUN dep init && go install

# Runtime Image

FROM golang:1.10-stretch

COPY --from=build /go/bin/go-hello /go/bin/

ENTRYPOINT go-hello

EXPOSE 80

