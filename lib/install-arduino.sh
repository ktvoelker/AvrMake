#!/bin/sh

set -e

NAME="$1"
SRCDIR="$2"
INCLUDE="$3"

TMP="$(mktemp -d -t avrmake)"
cp -a "$SRCDIR/"* "$TMP/"

MAKEFILE="$TMP/Makefile"

echo "NAME := $NAME" > "$MAKEFILE"
echo "INCLUDE := $INCLUDE" >> "$MAKEFILE"
echo "LIBRARY := true" >> "$MAKEFILE"
echo 'include $(AVRMAKE)/share/main.mk' >> "$MAKEFILE"

cd "$TMP" && make install

