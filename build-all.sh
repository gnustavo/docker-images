#!/bin/bash

# Copyright (C) 2020 by CPQD

# http://www.dwheeler.com/essays/fixing-unix-linux-filenames.html
IFS=$(printf '\n\t')
set -exu

DOCKER_BUILDKIT=1 parallel --tmuxpane 'cd {} ; make build' ::: prove-*
