FROM ubuntu:14.04
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>" \
      description="Ubuntu 14.04 Git::Hooks test environment"

# Install basic packages, generate pt_BR locales and configure timezone.

ENV TZ=America/Sao_Paulo

RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install curl unzip gcc git make lsb-release lsb-core perl libtext-glob-perl libpath-tiny-perl liburi-escape-xs-perl libgit-repository-perl libgit-repository-plugin-log-perl libemail-simple-perl liblist-moreutils-perl libencode-perl \
  && apt-get clean \
  && localedef -c -i pt_BR -f ISO-8859-1 pt_BR.ISO-8859-1 \
  && localedef -c -i pt_BR -f UTF-8 pt_BR.UTF-8

# Install non-packaged Git::Hooks Perl dependencies

RUN  curl -L https://cpanmin.us | perl - App::cpanminus \
  && cpanm --installdeps --notest Git::Hooks \
  && cpanm --notest IO::Interactive \
  && rm -rf $HOME/.cpanm

WORKDIR /docker

ENTRYPOINT ["prove", "-l", "-j", "4"]

CMD ["t"]
