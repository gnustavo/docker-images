FROM perl:5.36
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>" \
      description="Perl 5.36 test environment"

# Install basic packages, generate pt_BR locales and configure timezone.

ENV TZ=America/Sao_Paulo

#RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install \
#       curl \
#       gcc \
#       git \
#       libssl-dev \
#       locales \
#       lsb-core \
#       lsb-release \
#       make \
#       unzip \
#  && apt-get clean \
#  && localedef -c -i pt_BR -f ISO-8859-1 pt_BR.ISO-8859-1 \
#  && localedef -c -i pt_BR -f UTF-8 pt_BR.UTF-8

# Install Perl modules

RUN  cpanm \
       Email::Simple \
       Encode \
       Git::Repository::Plugin::Log \
       IO::Interactive \
       List::MoreUtils \
       Net::SSLeay \
       Path::Tiny \
       Text::Glob \
       URI::Escape::XS \
  && cpanm --installdeps \
       Git::Hooks \
       JIRA::REST \
  && rm -rf $HOME/.cpanm

WORKDIR /docker

ENTRYPOINT ["prove"]

CMD ["-l", "-j", "4", "t"]
