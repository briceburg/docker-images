# briceburg/jwt-cli

[jwt-go](https://github.com/dgrijalva/jwt-go/tree/master/cmd/jwt) command contained.



## usage
```
docker run briceburg/jwt-cli
```

### generate a token
```
 echo {\"foo\":\"bar\"} | ./jwt -key ../../test/sample_key -alg RS256 -sign - | ./jwt -key ../../test/sample_key.pub -alg RS256 -verify -
```
