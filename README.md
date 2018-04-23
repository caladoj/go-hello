# README

hello-go is a basic Hello World web app using [Golang](https://golang.org), [Gin](https://github.com/gin-gonic/gin), and [Docker](https://www.docker.com/).

It's useful as a test app for various deployment techniques. Using gin and debian is overkill but make the project a useful starting point for other projects.

## Build

```
$ docker build -t go-hello .
```

## Run

```
$ docker run --rm -d -p 8080:80 go-hello
```

## Use

In the examples below, the `http` cli tool comes from installing [httpie](https://httpie.org/) but any client will work.

### Plain Text

```
$ http localhost:8080
HTTP/1.1 200 OK
Content-Length: 13
Content-Type: text/plain; charset=utf-8
Date: Mon, 23 Apr 2018 15:05:35 GMT

hello, world

```

### JSON

$ http localhost:8080/ping
HTTP/1.1 200 OK
Content-Length: 18
Content-Type: application/json; charset=utf-8
Date: Mon, 23 Apr 2018 15:01:58 GMT

{
    "message": "pong"
}

```

