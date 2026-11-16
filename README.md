[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/wikijs-2?utm_medium=integration&utm_source=button&utm_campaign=wikijs)

# Wiki.js on Railway

This repo is the Railway template for [Wiki.js](https://js.wiki), the open-source wiki built on Node.js and PostgreSQL. Railway builds the `Wiki.js` service from this repo.

## What it deploys

| Service | Source | Notes |
|---|---|---|
| **Wiki.js** | this repo (`Dockerfile`) | Official image `ghcr.io/requarks/wiki:3.4.0`, pinned by digest. Public domain on port 3000, health check `/_ready`, volume at `/wiki/data` |
| **Postgres** | Railway PostgreSQL 18 | Wiki.js 3 needs PostgreSQL 17 or later. Pages, users, settings and uploaded files live here |

The wrapper is small: `railway-start.sh` gives the `node` user the Railway volume, maps Railway's `PORT` to `WIKI_PORT`, then starts Wiki.js unprivileged.

## Variables

| Variable | Value | Notes |
|---|---|---|
| `ADMIN_EMAIL` | you enter it | Email of the first administrator account |
| `ADMIN_PASS` | generated (`${{secret(24)}}`) | First administrator password. Read it in the Wiki.js service's **Variables** tab, sign in, then change it under your profile |
| `DATABASE_URL` | `${{Postgres.DATABASE_URL}}` | Private network connection to Postgres |
| `PORT` | `3000` | Port Wiki.js listens on |

`ADMIN_EMAIL` and `ADMIN_PASS` are read only on the first start against an empty database. Changing them later does nothing; change the account in Wiki.js instead.

Optional settings such as mail (SMTP), sign-in providers, `LOG_LEVEL` or `OFFLINE` can be added as variables or set in **Administration**. See the [Wiki.js docs](https://docs.js.wiki/setup/installation).

## Updates

Each change to this repo's `main` branch is one template version, listed in [CHANGELOG.md](CHANGELOG.md). Railway shows an "update available" notice to everyone who deployed the template, and you choose when to apply it. Read the changelog first: Wiki.js runs its database migrations on start, so take a Postgres backup before a major upgrade.
