FROM alpine
MAINTAINER Facundo Acevedo <facevedo@disroot.org>

run apk update && \
    apk add murmur


VOLUME ["/data"]

EXPOSE 64738 64738/udp

# A little of sec
COPY cleaner.sh /
RUN sh cleaner.sh && \
    rm cleaner.sh

COPY entrypoint.sh /root
RUN chmod 500 /root/entrypoint.sh



#ENTRYPOINT ["/bin/sh"]
ENTRYPOINT ["/root/entrypoint.sh"]
