# Gnustavo's Docker Images #

This repo contains specifications for a few docker images I use for testing
purposes. It probably isn't useful to anyone else.

Each image directory has a Makefile providing a few phony targets:

  * `make build`: Builds the image. This is the default target, so that you may
    simplify it to just `make`. The image names are of the form `gnustavo/DIR`,
    where `DIR` is the image directory name.
  * `make shell`: Runs the image replacing its ENTRYPOINT by `/bin/bash` so that
    you can get inside the container to poke around.
  * `make push`: Pushes the image to my DockerHub account.

That's it, so far.

## prove-* images ##

The `prove-*` images are used to invoke Perl's prove command in specific OS
versions. My Perl modules should support versions of Perl and Git based on the
native package versions of the oldest [Ubuntu
LTS](https://en.wikipedia.org/wiki/Ubuntu_version_history) and
[CentOS](https://en.wikipedia.org/wiki/CentOS) versions still getting
maintenance updates.

This is the situation in April, 2018:

| Distro | EOL | Perl | Git |
|  --- | --- | --- | --- |
| Ubuntu 12.04 (precise) | 2017-04 | 5.14.2 | 1.7.9.5 |
| Ubuntu 14.04 (trusty) | 2019-04 | 5.18.2 | 1.9.1 |
| Ubuntu 16.04 (xenial) | 2021-04 | 5.22.1 | 2.7.4 |
| Ubuntu 18.04 (bionic) | 2023-04 | 5.26.1 | 2.17.1 |
| Ubuntu 20.04 (focal) | 2025-04 | 5.30.0 | 2.25.1 |
| Ubuntu 22.04 (jammy) | 2027-04 | 5.34.0 | 2.34.1 |
| CentOS 6 | 2020-11 | 5.10.1 | 1.7.1 |
| CentOS 7 | 2024-06 | 5.16.3 | 1.8.3.1 |
| CentOS 8 | 2029-05 | 5.26.3 | 2.18.4 |

Each `prove-*` directory contains a `Dockerfile` specifying a Docker image with
the native Git and Perl installed. We try to use native packages for the Perl
modules also. Modules that don't have native packages are installed via cpanm.
