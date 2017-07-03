#!/bin/bash

app=$(find /app -type f -name "app.psgi" | head -n1)

if [ -n $app ]
then
	echo "found $app"
	plackup -r /app/$app
else
	echo "no app found. generating now. Give Namespace::Appname:"
	read Appname
	dancer2 -a $Appname
fi

