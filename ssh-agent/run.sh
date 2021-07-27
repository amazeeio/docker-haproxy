#!/bin/sh

case "$1" in
    ssh-agent)
        # NOTE: openssh 6.9 introduces -D for running ssh-agent in the foreground.
        rm -f ${SSH_AUTH_SOCK}
        exec sudo -u drupal /usr/bin/ssh-agent -a ${SSH_AUTH_SOCK} -d 2>&1
        ;;
    windows-key-add)
        cp -f $2 $2_
        chmod 400 $2_
        exec ssh-add $2_ 2>&1
        ;;
    *)
        exec $@;;
esac