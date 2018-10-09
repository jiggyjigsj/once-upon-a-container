FROM alpine:3.8
LABEL maintainer="jjp1023@gmail.com"

RUN apk --no-cache add --update bash \
  sudo \
  openssh

EXPOSE 22

COPY bootme.sh /usr/bin/bootme.sh

RUN chmod +x /usr/bin/bootme.sh

ENTRYPOINT ["/usr/bin/bootme.sh"]
