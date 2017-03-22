#!/usr/bin/env bash

if test $MAKELEVEL -ne 1; then
    echo "Do not run this file directly, use 'make install' instead!" >&2
    exit 1
fi

DESTDIR="$1"

cd src

# FIXME .. Add some test for npm registry timeout & then prompt for $NPM_REGISTRY env .. from makefile?
npm config set registry https://npm.dev
npm config set strict-ssl false

# Install prerequisities
npm install -g less dustjs-linkedin

# Now run gradlew
./gradlew build installDist

# TODO:
# Put azkaban-solo-server/build/install/azkaban-solo-server/ into debian for packaging ..
