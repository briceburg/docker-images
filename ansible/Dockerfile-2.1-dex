FROM briceburg/ansible:2.1

#
# dex ansible:2.1-dex
#

ENV \
  ANSIBLE_RETRY_FILES_SAVE_PATH=/dex/home/.ansible/retry-files \
  ANSIBLE_TIMEOUT=25


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_envars="LANG TZ ANSIBLE_*" \
  org.dockerland.dex.docker_flags="-it" \
  org.dockerland.dex.docker_home="ansible" \
  org.dockerland.dex.docker_volumes="~/.ssh/id_rsa:/dex/home/.ssh/id_rsa:ro \$ANSIBLE_CFG:\$ANSIBLE_CFG:ro ~/.ansible.cfg:/dex/home/.ansible.cfg:ro /etc/ansible/ansible.cfg" \
  org.dockerland.dex.host_users="ro" \
  org.dockerland.dex.host_paths="rw"
