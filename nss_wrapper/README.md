# briceburg/nss_wrapper

A [nss_wrapper](https://cwrap.org/nss_wrapper.html) helper image used to
execute commands with mock credentials.

Handy for executing commands requiring a system user inside containers running under an arbitrary uid.  E.g. ssh requires a valid user, and we
execute in a container using my current user's id [1000]...

*without nss_wrapper*
```
$ docker run -it --rm -u $(id -u) image-with-ssh ssh
No user exists for uid 1000
```

*with nss_wrapper*
```
$ docker run -it --rm -u $(id -u) briceburg/nss_wrapper ssh
usage: ssh [-1246AaCfgKkMNnqsTtVvXxYy] [-b bind_address] [-c cipher_spec]
           ...
```


### Runtime Example

By default, nss_wrapper will mock a system user using the current user's id and gid. Override this behavior by providing NSS_USERNAME, NSS_UID, NSS_GROUPNAME, and/or NSS_GID. E.g.

```
$ docker run --rm \
-e NSS_USERNAME=anonymous \
-e NSS_UID=9999 \
-e NSS_GROUPNAME=anonymous \
-e NSS_GID=9999 \
briceburg/nss_wrapper id anonymous
uid=9999(anonymous) gid=9999(anonymous) groups=9999(anonymous)
```


### Dockerfile Example

To wrap a command, e.g. `git`, base your image off this one. E.g. 

```
FROM briceburg/nss_wrapper:debian-8
RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/nss-wrap.sh", "git"]
```



### In-the-Wild

The :dex variant is used by a few [dex](https://github.org/dockerland/dex) images to map the host's _real_ username and _real_ groupname into containers. See the [git Dockerfile]() for an example.
