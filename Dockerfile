FROM alpine:latest
STOPSIGNAL 9
RUN apk update && apk add curl wget perl-dev perl make gcc git tzdata libc-dev docker

RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm Dancer2 Plack::Middleware::Deflater

ENV TZ Europe/Berlin
EXPOSE 5000

WORKDIR /app
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh
CMD ["/entrypoint.sh"]
