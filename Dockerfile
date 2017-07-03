FROM alpine:latest
RUN apk update && apk add curl wget perl-dev perl make gcc git tzdata libc-dev

RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm Dancer2 Plack::Middleware::Deflater

ENV TZ Europe/Berlin
EXPOSE 5000

WORKDIR /app
COPY default.sh /
CMD ["/default.sh"]
