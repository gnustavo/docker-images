FROM ubuntu:18.04
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>" \
      description="Ubuntu 18.04 Perl test environment"

# Install basic packages, generate pt_BR locales and configure timezone.

ENV TZ=America/Sao_Paulo

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    curl \
    cpanminus \
    gcc \
    git \
    libconfig-identity-perl \
    libemail-simple-perl \
    libencode-perl \
    libgit-repository-perl \
    libgit-repository-plugin-log-perl \
    libhtml-tree-perl \
    libhttp-message-perl \
    libjson-perl \
    liblist-moreutils-perl \
    liblog-any-perl \
    libnet-ssleay-perl \
    libpath-tiny-perl \
    libssl-dev \
    libtext-glob-perl \
    liburi-escape-xs-perl \
    liburi-perl \
    locales \
    lsb-core \
    lsb-release \
    make \
    perl \
    unzip\
 && rm -rf /var/lib/apt/lists/*

RUN localedef -c -i pt_BR -f ISO-8859-1 pt_BR.ISO-8859-1 \
 && localedef -c -i pt_BR -f UTF-8 pt_BR.UTF-8

# Install non-packaged Perl modules

RUN cpanm --installdeps --notest Git::Hooks \
 && cpanm --installdeps --notest JIRA::REST \
 && cpanm --notest IO::Interactive \
 && rm -rf $HOME/.cpanm

WORKDIR /docker

ENTRYPOINT ["prove"]

CMD ["-l", "-j", "4", "t"]
