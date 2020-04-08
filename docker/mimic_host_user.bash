#!/usr/bin/env bash

# create and log into a mimic of the host user
user="${HOST_USER_NAME}"
useradd --uid ${HOST_USER_ID} ${user} --no-create-home

# careful not to modify host volumes
find /home -group user | xargs chown ${user}:${user}
ln -s /home/user /home/${user}

# ensure mimic has access to docker
docker_group=$(stat --format='%G' /var/run/docker.sock)
docker_group_id=$(stat --format='%g' /var/run/docker.sock)
groupadd --gid ${docker_group_id} ${docker_group}
usermod --groups ${docker_group}  ${user}

sudo --set-home --user=${user} bash
