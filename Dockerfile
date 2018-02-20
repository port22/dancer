FROM alpine:edge
STOPSIGNAL 9
RUN apk update && apk add curl wget perl-dev perl make gcc git tzdata libc-dev docker

RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm --force -n Dancer2 Plack::Middleware::Deflater Dancer2::Template::TemplateToolkit

ENV TZ Europe/Berlin
EXPOSE 5000

WORKDIR /app
CMD ["/usr/bin/perl", "/usr/local/bin/plackup", "-r", "/app/bin/app.psgi"]
