FROM alpine:edge

MAINTAINER Rémi Passmoilesel <remi.passmoilesel@gmail.com>

EXPOSE 22 8118 9050

# Add testing repository
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

# Update and install dependencies
RUN apk update && apk add \
        privoxy tor@testing runit@testing openssh shadow

# dev dependencies
RUN apk add bash vim

RUN  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN  usermod --password azerty root
#RUN  adduser -D -g 0 remipassmoilesel

COPY service /etc/service/
COPY  /etc/service/

CMD ["runsvdir", "/etc/service"]
