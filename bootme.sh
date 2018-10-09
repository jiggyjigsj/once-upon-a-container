#!/bin/bash

export USER=${USER:-groot}
export PASSWORD=${PASSWORD:-trymebruh}

echo -e "$PASSWORD\n$PASSWORD\n" | adduser "$USER"
echo -e "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/"$USER"

# generate host keys if not present
ssh-keygen -A

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"
