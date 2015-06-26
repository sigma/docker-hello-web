FROM gliderlabs/alpine:3.2
ENTRYPOINT ["/bin/hello"]
EXPOSE 8080

COPY . /go/src/github.com/sigma/hello-web

RUN apk-install -t build-deps go \
	&& cd /go/src/github.com/sigma/hello-web \
	&& export GOPATH=/go \
	&& go build -o /bin/hello \
	&& rm -rf /go \
	&& apk del --purge build-deps
