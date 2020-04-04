#!/usr/bin/env bash

# create and log into a mimic of the host user
user="${HOST_USER_NAME}"
useradd --uid ${HOST_USER_ID} ${user} --no-create-home
chown -R ${user}:${user} /home/user
ln -s /home/user /home/${user}

sudo -H -u ${user} bash
