#!/bin/sh

if [ "$#" -lt 1 ]; then
  echo "Need import endpoint!"
  exit 1
fi

if [ -z "$ARANGO_USER" ]; then
  ARANGO_USER="root"
fi

echo "User: $ARANGO_USER"

xzcat /profiles.json.xz | \
  arangoimp --server.endpoint $1 --type json --file - --collection profiles --server.username "$ARANGO_USER" --server.password "$ARANGO_PASSWORD"

xzcat /relations.tsv.xz | \
  arangoimp --server.endpoint $1 --type tsv --file - --collection relations --server.username "$ARANGO_USER" --server.password "$ARANGO_PASSWORD"
