FROM centos:6
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>"

# Install basic packages, generate pt_BR locales and configure timezone.

ENV TZ=America/Sao_Paulo

RUN  yum -y update \
  && yum install -y unzip curl gcc perl perl-ExtUtils-MakeMaker git \
  && yum clean all \
  && localedef -c -i pt_BR -f ISO-8859-1 pt_BR.ISO-8859-1 \
  && localedef -c -i pt_BR -f UTF-8 pt_BR.UTF-8 \
  && rm -rf $HOME/install.log* $HOME/anaconda-ks.cfg

WORKDIR /root

RUN  curl -L https://cpanmin.us | perl - App::cpanminus \
  && cpanm --installdeps --notest https://cpan.metacpan.org/authors/id/G/GN/GNUSTAVO/Git-Hooks-2.3.0.tar.gz \
  && rm -rf $HOME/.cpanm

VOLUME ["/code"]
