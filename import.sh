#!/bin/sh

if [ "$#" -lt 1 ]; then
  echo "Need import endpoint!"
fi

xzcat /profiles.json.xz | arangoimp --server.endpoint $1 --type json --file - --collection profiles
xzcat /relations.tsv.xz | arangoimp --server.endpoint $1 --type tsv --file - --collection relations
