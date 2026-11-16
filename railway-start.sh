#!/bin/sh
# Small Railway wrapper for the official Wiki.js image.
set -e

# Railway provides PORT; Wiki.js reads WIKI_PORT (its config.yml pins 3000).
export WIKI_PORT="${WIKI_PORT:-${PORT:-3000}}"

if [ "$(id -u)" = "0" ]; then
  mkdir -p /wiki/data/content /wiki/data/repo
  # A fresh Railway volume is owned by root; hand it to the image's `node` user once.
  if [ "$(stat -c %u /wiki/data)" != "$(id -u node)" ]; then
    chown -R node:node /wiki/data
  fi
  exec setpriv --reuid=node --regid=node --init-groups env HOME=/home/node "$@"
fi

exec "$@"
