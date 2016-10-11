#!/usr/bin/env bash

__username=${DEX_HOST_USER:-$(id -un)}
__uid=${DEX_HOST_UID:-$(id -u)}

__groupname=${DEX_HOST_GROUP:-$(id -gn)}
__gid=${DEX_HOST_GID:-$(id -g)}

echo "$__username:x:$__uid:$__uid:gecos:$HOME:/bin/bash" > $NSS_WRAPPER_PASSWD
echo "$__groupname:x:$__gid:" > $NSS_WRAPPER_GROUP

export LD_PRELOAD=/usr/local/lib64/libnss_wrapper.so
exec $@
