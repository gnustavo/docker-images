# Git::Hooks test image #

This image is intended to be used as a testing bed for
[Git::Hooks](https://metacpan.org/pod/Git::Hooks). It contains the oldest
versions of Perl and Git supported by Git::Hooks. I use it to make sure I'm not
using Perl or Git features which were implemented in newer versions.

## Build / Shell / Push ##

There is a Makefile in this directory to make it easier to build and use this
image. It has three targets:

  * **make build**: builds the image. This is the default target.
  * **make push**: pushes the image to the Docker Hub.
  * **make shell**: runs /bin/bash in a container from the image.

## Use it for testing ##

In order to use it I go to my Git::Hooks clone directory, build a tar ball with
the next version and test it with docker, like this:

```
cd /path/to/git-hooks
dzil build
TAR=$(ls Git-Hooks-*.tar.gz | tail -1)
docker run --rm -i -t -v $PWD:/code gnustavo/git-hooks-test /bin/bash --login -c "cpanm -v /code/$TAR"
```

I decide which versions of Perl and Git to support based on the native package
versions of the oldest Ubuntu LTS and CentOS versions still getting maintenance
updates.

This is the situation in December, 2017:

| Distro | EOL | Perl | Git |
|  --- | --- | --- | --- |
| Ubuntu 12.04 (precise) | 2017-04 | 5.14.2 | 1.7.9.5 |
| Ubuntu 14.04 (trusty) | 2019-04 | 5.18.2 | 1.9.1 |
| Ubuntu 16.04 (xenial) | 2021-04 | 5.22.1 | 2.7.4 |
| CentOS 6 | 2020-11 | 5.10.1 | 1.7.1 |
| CentOS 7 | 2024-06 | 5.16.3 | 1.8.3.1 |
