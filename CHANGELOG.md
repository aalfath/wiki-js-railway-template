# Changelog

Each entry is one version of this Railway template. Breaking changes come first.

## 3.5.0 (2026-11-21)

- No breaking changes. Pages, users and settings in Postgres and files on the `/wiki/data` volume are kept. Wiki.js runs three new database migrations on its first start (import references and navigation placement); they can't be undone, so back up Postgres before you apply the update.
- Wiki.js [3.5.0](https://github.com/requarks/wiki/releases/tag/3.5.0): import tools for Confluence, DokuWiki and XWiki, default and locked content block values, more navigation options, and fixes (Postgres pub/sub reconnects, inline images, two-factor reset, group login redirects).
- Image: `ghcr.io/requarks/wiki:3.5.0@sha256:3de0495234db06fc3ad78b8a6dc71ff297b55ed0d3b37d61eb0fbfe767f6e5b6`.

## 3.4.0-1 (2026-11-16)

- README: add the Deploy on Railway button for the published template `wikijs-2`. No change to the app or its image.

## 3.4.0 (2026-11-16)

- First release of the template: Wiki.js 3.4.0
  (`ghcr.io/requarks/wiki:3.4.0@sha256:9424867464d9d899f975bbadb8ff1f794341eadd720b5fb5c22f0988c62e29bf`)
  with Railway PostgreSQL 18, a volume at `/wiki/data` and a generated administrator password.
