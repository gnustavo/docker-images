FROM centos:6
LABEL maintainer="Gustavo Chaves <gustavo@cpan.org>" \
      description="CentOS 6 Perl test environment"

# Install basic packages, generate pt_BR locales and configure timezone.

ENV TZ=America/Sao_Paulo

RUN yum install -y \
    curl \
    gcc \
    git \
    openssl \
    openssl-devel \
    perl \
    perl-ExtUtils-MakeMaker \
    perl-JSON \
    perl-List-MoreUtils \
    perl-Text-Glob \
    perl-URI \
    unzip \
 && yum clean all \
 && rm -rf $HOME/install.log* $HOME/anaconda-ks.cfg

RUN localedef -c -i pt_BR -f ISO-8859-1 pt_BR.ISO-8859-1 \
 && localedef -c -i pt_BR -f UTF-8 pt_BR.UTF-8

# Install non-packaged Git::Hooks Perl dependencies

RUN curl -L https://cpanmin.us | perl - -n App::cpanminus \
 && cpanm --installdeps --notest Git::Hooks \
 && cpanm --installdeps --notest JIRA::REST \
 && rm -rf $HOME/.cpanm

WORKDIR /docker

ENTRYPOINT ["prove"]

CMD ["-l", "-j", "4", "t"]
