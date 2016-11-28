FROM alpine:edge

MAINTAINER Rémi Passmoilesel <remi.passmoilesel@gmail.com>

EXPOSE 22 80 9050

# Add testing repository
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

# Update and install dependencies
RUN apk update
RUN apk add tor@testing runit@testing openssh shadow
RUN apk add lighttpd lighttpd-mod_auth openssl
RUN apk add php5-common php5-iconv php5-json php5-gd php5-curl php5-xml php5-pgsql php5-imap php5-cgi fcgi
RUN apk add php5-pdo php5-pdo_pgsql php5-soap php5-xmlrpc php5-posix php5-mcrypt php5-gettext php5-ldap php5-ctype php5-dom

# Dev dependencies
# RUN apk add bash vim

# Create key for SSL support
RUN openssl req \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.nowhere.com" \
    -keyout "/etc/lighttpd/rsa.key" \
    -out "/etc/lighttpd/rsa.crt"

RUN cat "/etc/lighttpd/rsa.key" "/etc/lighttpd/rsa.crt" > "/etc/lighttpd/rsa.pem"
RUN chmod 400 "/etc/lighttpd/rsa.pem"

#openssl req -x509 -newkey rsa:4096 -keyout server.pem -out server.pem -days 365

# Configure OpenSSH server
RUN  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

# Change default credentials here
RUN  adduser -D anonymous-tux
RUN  echo "anonymous-tux:password" | chpasswd

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
RUN  chown -R lighttpd:lighttpd /etc/lighttpd

# Entry point command
CMD ["runsvdir", "/etc/service"]
