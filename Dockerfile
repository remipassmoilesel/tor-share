FROM alpine:edge

MAINTAINER Rémi Passmoilesel <remi.passmoilesel@gmail.com>

EXPOSE 22 80 9050

# Add testing repository
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

# Update and install dependencies
RUN apk update
RUN apk add tor@testing runit@testing openssh shadow
RUN apk add lighttpd lighttpd-mod_auth
RUN apk add php5-common php5-iconv php5-json php5-gd php5-curl php5-xml php5-pgsql php5-imap php5-cgi fcgi
RUN apk add php5-pdo php5-pdo_pgsql php5-soap php5-xmlrpc php5-posix php5-mcrypt php5-gettext php5-ldap php5-ctype php5-dom

# Dev dependencies
# RUN apk add bash vim

# Configure OpenSSH server
RUN  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

# Change default credentials here
RUN  adduser -D -g 0 heyhey
RUN  echo "heyhey:N24WMxSPMOTk8" | chpasswd

# Copy configuration files
COPY etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY etc/lighttpd/lighttpd-password /etc/lighttpd/lighttpd-password
COPY etc/php5/php.ini /etc/php5/php.ini
COPY etc/tor/torrc /etc/tor/torrc

# Copy services scripts to run
COPY service /etc/service/

# Copy files to publish
COPY www /www
RUN  chown -R lighttpd:lighttpd /www

# Entry point command
CMD ["runsvdir", "/etc/service"]
