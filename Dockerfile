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

COPY prepare_config.sh /
RUN sh prepare_config.sh && \
    rm prepare_config.sh



#ENTRYPOINT ["/bin/sh"]
#ENTRYPOINT ["/root/entrypoint.sh"]

ENTRYPOINT ["murmurd", "-fg", "-v"]
CMD ["-ini", "/data/murmur.ini"]
