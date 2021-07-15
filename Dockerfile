FROM httpd
LABEL maintainer="v.stone@163.com"

RUN apt-get update \
    && apt-get install -y subversion \
    && apt-get install -y libapache2-mod-svn \
    && mkdir /var/repos

WORKDIR /var/repos

EXPOSE 80
EXPOSE 3690