# Wiki.js 3.5.0, pinned by version and digest (multi-arch index: linux/amd64 + linux/arm64).
# Bump both the tag and the digest together, and add a CHANGELOG.md entry.
FROM ghcr.io/requarks/wiki:3.5.0@sha256:3de0495234db06fc3ad78b8a6dc71ff297b55ed0d3b37d61eb0fbfe767f6e5b6

# Start as root only long enough to give the `node` user the Railway volume
# (Railway mounts volumes owned by root), then drop privileges.
USER root
COPY --chmod=755 railway-start.sh /usr/local/bin/railway-start.sh

# The image's own config.yml reads DB_* / DATABASE_URL from the environment.
# Everything Wiki.js writes outside the database lives under /wiki/data.
WORKDIR /wiki
EXPOSE 3000

ENTRYPOINT ["tini", "-s", "--", "/usr/local/bin/railway-start.sh"]
CMD ["node", "--no-experimental-webstorage", "backend"]
