# Git::Hooks test image #

This image is intended to be used as a testing bed for
[Git::Hooks](https://metacpan.org/pod/Git::Hooks). It contains the oldest
versions of Perl and Git supported by Git::Hooks. I use it to make sure I'm not
using Perl or Git features which were implemented in newer versions.

In order to use it I go to my Git::Hooks clone directory, build a tar ball with
the next version and test it with docker, like this:

```
cd /path/to/git-hooks
dzil build
TAR=$(ls Git-Hooks-*.tar.gz | tail -1)
docker run --rm -i -t -v $PWD:/code gnustavo/git-hooks-test /bin/bash --login -c "cpanm -v /code/$TAR"
```