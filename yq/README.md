# briceburg/yq

[yq](https://github.com/kislyuk/yq) contained.


## usage
```
echo '{"foo": "bar"}' | docker run --rm -i briceburg/yq .foo
```

(when passing stdin, use the --interactive flag)
