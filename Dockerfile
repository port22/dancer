FROM perl:5
STOPSIGNAL 9
HEALTHCHECK CMD curl -f http://localhost:5000/ || exit 1

RUN cpanm --force -n Dancer2 Plack::Middleware::Deflater Dancer2::Template::TemplateToolkit \
  Switch \
  Dancer2::Plugin::Auth::Extensible \
    Dancer2::Plugin::Auth::Extensible::Provider::LDAP \
  File::Slurper \
  DBD::SQLite \
  Dancer2::Plugin::Database

EXPOSE 5000
WORKDIR /app
CMD ["/usr/bin/perl", "/usr/local/bin/plackup", "-r", "/app/bin/app.psgi"]
