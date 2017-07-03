#!/bin/sh

app=$(find /app -type f -name "app.psgi" | head -n1)

if [ -z $app ]
then
    echo "no app found. generating now. Give Namespace::Appname:"
    read Appname
    dancer2 -a $Appname
else
    echo "found $app"
    plackup -r $app
fi

