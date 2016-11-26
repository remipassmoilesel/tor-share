FROM alpine:edge

MAINTAINER Rémi Passmoilesel <remi.passmoilesel@gmail.com>

EXPOSE 22 8118 9050

# Add testing repository
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

# Update and install dependencies
RUN apk update

RUN apk add privoxy tor@testing runit@testing openssh shadow

RUN apk add lighttpd php5-common php5-iconv php5-json php5-gd php5-curl php5-xml php5-pgsql php5-imap php5-cgi fcgi
RUN apk add php5-pdo php5-pdo_pgsql php5-soap php5-xmlrpc php5-posix php5-mcrypt php5-gettext php5-ldap php5-ctype php5-dom

# dev dependencies
RUN apk add bash vim

RUN  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN  adduser -D -g 0 heyhey
RUN  usermod --password azerty heyhey

COPY etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY etc/php5/php.ini /etc/php5/php.ini

COPY service /etc/service/
COPY www /www
RUN  chown -R lighttpd:lighttpd /www

CMD ["runsvdir", "/etc/service"]
