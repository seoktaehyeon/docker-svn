FROM httpd:2.4
LABEL maintainer="v.stone@163.com"

RUN apt-get update \
    && apt-get install -y subversion \
    && apt-get install -y libapache2-mod-svn \
    && svnserve --version \
    && svn --version \
    && mkdir /var/repos \
    && htpasswd -cm /etc/apache2/dav_svn.passwd admin opendevops \
    && echo '#!/bin/bash' > /etc/rc0.d/.sh \
    && echo 'svnserve -d -r /var/repos' >> /etc/rc0.d/.sh \
    && echo 'LoadModule dav_svn_module /usr/lib/apache2/modules/mod_dav_svn.so' >> /usr/local/apache2/conf/httpd.conf \
    && echo '<Location /svn>' >> /usr/local/apache2/conf/httpd.conf \
    && echo '  DAV svn' >> /usr/local/apache2/conf/httpd.conf \
    && echo '  SVNParentPath /var/repos' >> /usr/local/apache2/conf/httpd.conf \
    && echo '  AuthType Basic' >> /usr/local/apache2/conf/httpd.conf \
    && echo '  AuthName "Subversion Repository"' >> /usr/local/apache2/conf/httpd.conf \
    && echo '  AuthUserFile /etc/apache2/dav_svn.passwd' >> /usr/local/apache2/conf/httpd.conf \
    && echo '  Require valid-user' >> /usr/local/apache2/conf/httpd.conf \
    && echo '</Location>' >> /usr/local/apache2/conf/httpd.conf

WORKDIR /var/repos

EXPOSE 80
EXPOSE 443
EXPOSE 3690
