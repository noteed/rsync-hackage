#! /bin/bash

rsync --daemon
tail -F /var/log/rsyncd.log
