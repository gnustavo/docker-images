FROM ubuntu:14.04
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>" \
      description="Ubuntu 14.04 Perl test environment"

# Install basic packages, generate pt_BR locales and configure timezone.

ENV TZ=America/Sao_Paulo

RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install curl unzip gcc git make \
    lsb-release lsb-core perl libtext-glob-perl libpath-tiny-perl \
    liburi-escape-xs-perl libgit-repository-perl libgit-repository-plugin-log-perl \
    libemail-simple-perl liblist-moreutils-perl libencode-perl libssl-dev \
  && apt-get clean \
  && localedef -c -i pt_BR -f ISO-8859-1 pt_BR.ISO-8859-1 \
  && localedef -c -i pt_BR -f UTF-8 pt_BR.UTF-8

# Install non-packaged Perl modules

RUN  curl -L https://cpanmin.us | perl - App::cpanminus \
  && cpanm --installdeps --notest Git::Hooks \
  && cpanm --installdeps --notest JIRA::REST \
  && cpanm --notest IO::Interactive \
  && rm -rf $HOME/.cpanm

WORKDIR /docker

ENTRYPOINT ["prove"]

CMD ["-l", "-j", "4", "t"]
