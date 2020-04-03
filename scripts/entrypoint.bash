#!/usr/bin/env bash

user="${HOST_USER_NAME}"
useradd -u ${HOST_USER_ID} ${user}
mv /home/user /home/${user}
chown ${user}:${user} /home/${user}

su ${user}
exec sh
