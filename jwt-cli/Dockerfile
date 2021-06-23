FROM golang:1.14 as builder
RUN  go get github.com/dgrijalva/jwt-go/cmd/jwt && \
     CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
       go build -ldflags="-w -s" github.com/dgrijalva/jwt-go/cmd/jwt

FROM scratch
COPY --from=builder /go/jwt /jwt
ENTRYPOINT ["/jwt"]
