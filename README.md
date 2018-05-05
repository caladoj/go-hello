# hello-go

hello-go is a basic Hello World web app using [Golang](https://golang.org), [Gin](https://github.com/gin-gonic/gin), and [Docker](https://www.docker.com/).

It's useful as a test app for various deployment techniques. Using gin is overkill but makes this a good starting point for real projects.

The docker build is setup as a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) where the build stage will use [go dep](https://golang.github.io/dep/) to install dependencies and build the app but the final image contains only the app. The result is a build image that's 520MB but it's usually discarded and the runtime image that gets deployed is just 20MB.

## Build

### Runtime Image
```
$ docker build -t go-hello .
```
### Build Image
In case you want it for reference or for debugging
```
$ docker build --target build -t go-hello:build .
```

## Run

```
$ docker run --rm -p 8080:80 go-hello
```
### Interact with Build Image
```
$ docker run --rm -it go-hello:build ash
```

## Examples

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

```
$ http localhost:8080/ping
HTTP/1.1 200 OK
Content-Length: 18
Content-Type: application/json; charset=utf-8
Date: Mon, 23 Apr 2018 15:01:58 GMT

{
    "message": "pong"
}

```

