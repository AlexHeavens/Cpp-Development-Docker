#!/usr/bin/env bash

user="${HOST_USER_NAME}"
useradd --uid ${HOST_USER_ID} ${user}
mv -t /home/${user} /home/user/.config /home/user/.vscode
chown -R ${user}:${user} /home/${user}

bash
