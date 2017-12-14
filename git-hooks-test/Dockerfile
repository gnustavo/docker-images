FROM buildpack-deps:xenial
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>"

ARG PERL_VERSION=5.10.1
ARG CPANM_VERSION=1.7043

WORKDIR /root

RUN  curl -SL https://github.com/tokuhirom/plenv/archive/master.tar.gz -o plenv.tar.gz \
  && mkdir $HOME/.plenv \
  && tar --directory=$HOME/.plenv --strip-components=1 -zxvf plenv.tar.gz \
  && rm plenv.tar.gz \
  && echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> $HOME/.profile \
  && export PATH="$HOME/.plenv/bin:$PATH" \
  && echo 'if [ ${PLENV_SHELL:-unset} = unset ]; then eval "$(plenv init -)"; fi' >> $HOME/.profile \
  && eval "$(plenv init -)" \
  && curl -SL -o perl-build.tar.gz https://github.com/tokuhirom/Perl-Build/archive/master.tar.gz \
  && mkdir -p $HOME/.plenv/plugins/perl-build \
  && tar --directory=$HOME/.plenv/plugins/perl-build --strip-components=1 -zxvf perl-build.tar.gz \
  && rm perl-build.tar.gz \
  && plenv install ${PERL_VERSION} \
  && plenv rehash \
  && plenv global ${PERL_VERSION} \
  && plenv install-cpanm \
  && plenv rehash \
  && cpanm --installdeps --notest Git::Hooks \
  && rm -rf .cpanm .plenv/build/* .plenv/cache/*

ARG GIT_VERSION=1.7.2.3

RUN  curl -SL https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz -o git.tar.gz \
  && mkdir $HOME/git \
  && tar --directory=$HOME/git --strip-components=1 -zxvf git.tar.gz \
  && make -C $HOME/git prefix=/usr/local \
         NO_OPENSSL=YesPlease NO_CURL=YesPlease NO_EXPAT=YesPlease NO_TCLTK=YesPlease \
         install \
  && rm -rf git.tar.gz $HOME/git \
  && mkdir /code

VOLUME ["/code"]

