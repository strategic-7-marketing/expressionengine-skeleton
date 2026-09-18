# ExpressionEngine Skeleton With Foundation

**Default DB Credentials:**\
DB Name: ee-skeleton\
User: ee-skeleton\
Pass: ee-skeleton

**Default Admin Login Credentials:**\
User: admin\
Pass: ee-skel

## An ExpressionEngine Skeleton Website And Template Repository

This is meant to be a starting point for a new ExpressionEngine website build project.
Ideally this repository will be kept up to date with the latest needs from a starting point site.
A new project would be started from this template repository and modified as needed from there.

Upon cloning config/config.env.php will need modified with the agreed upon URLs including the local dev URL.
config/config.master.php may also need modified depending on need.
config/config.local.php is included as a template for local development but should not be tracked or comitted.
config/config.local.php is commented out in .gitignore please uncomment when creating a new repo from this template.

Included is an .htaccess_LIVE file intended for production. It is domain-agnostic, so no domain names need to be edited into it. It handles:

- **Canonical host:** Option A (default) redirects www to the apex (naked) domain, e.g. `www.example.com` -> `https://example.com`. If the client requires www as the primary domain, comment out Option A and uncomment Option B in the file, which does the reverse. Both options ignore environment subdomains (`staging.`, `stage.`, `dev.`, `test.`, `uat.`) so a staging site is never redirected to the production host.
- **HTTPS:** redirects HTTP to HTTPS for whatever host was requested, including behind a proxy or CDN that sets `X-Forwarded-Proto`. Staging subdomains must therefore have a valid TLS certificate.
- **Staging noindex:** sends an `X-Robots-Tag: noindex, nofollow` header on the environment subdomains above so search engines do not index them.
- **Clean URLs:** removes index.php from ExpressionEngine URLs.

This file is intended to be used with GitHub Actions to streamline deployment to the production server. For example using the following Deploy Via FTP action which will deploy the site when the main branch is comitted to the configured FTP server secrets (FTP_SERVER, FTP_USERNAME, and FTP_PASSWORD) furthermore it will delete any .htaccess file on the server and rename .htaccess_LIVE to .htaccess to take its place.

```
name: Deploy Via FTP
on:
  push:
    branches:
      - main
jobs:
  FTP-Deploy-Action:
    name: FTP-Deploy-Action
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v7
      with:
        fetch-depth: 2
    - name: FTP-Deploy-Action
      uses: SamKirkland/FTP-Deploy-Action@v4.4.0
      with:
        server: ${{ secrets.FTP_SERVER }}
        username: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
    - name: Rename htaccess Go Live
      shell: python
      run: |
        import ftplib
        ftp = ftplib.FTP('${{ secrets.FTP_SERVER }}')
        ftp.login('${{ secrets.FTP_USERNAME }}', '${{ secrets.FTP_PASSWORD }}')
        if '.htaccess_LIVE' in ftp.nlst():
          ftp.rename('.htaccess_LIVE', '.htaccess')
          print ('htaccess renamed')
        else:
          print ('.htaccess_LIVE not found nothing renamed')
        ftp.quit()
```
## Included Add-Ons And Preconfigurations

### Add-Ons

- WYGWAM

### Preconfigurations

- Added default additional menu items for Structure and Template Manager in the EE backend dashboard.

## Front-end Framework Branches

The `main` branch has no front-end framework. Start a new project from one of the framework branches below; each branch adds its framework's NPM package, a preconfigured `css/` source setup, and a "Using ..." section at the end of its README with build instructions.

- `bootstrap` branch includes an NPM package for Bootstrap and preconfiguration for using the Bootstrap front-end.

- `foundation` branch includes an NPM package for Foundation and preconfiguration for using the Foundation front-end.

- `tailwind` branch includes an NPM package for Tailwind and preconfiguration for using Tailwind.

## Using Foundation
Foundation for Sites (v6) is installed as an NPM package and compiled from Sass. The source lives in `css/`:

- `css/_settings.scss` - Foundation's settings file. Change global variables (colors, breakpoints, typography, component settings, etc.) here.
- `css/styles.scss` - the entry point. It uses Foundation's component mixins individually; comment out the `@include` lines for components the site does not use to reduce the CSS size. Only one grid system should be enabled (the XY grid is on by default).
- `css/_custom.scss` - site-specific custom styles, imported after Foundation.

The compiled output is `css/styles.min.css`, which the templates load from `_base-layout.html`.

First install the dependencies (Foundation and the Sass compiler): `npm install`

To begin watching for changes run: `npm run watch`

For a one-off minified production build run: `npm run build`

Both scripts are defined in `package.json` and compile `css/styles.scss` to `css/styles.min.css`.

Foundation's JavaScript is not included in the templates by default. If interactive components (reveal, off-canvas, dropdown menus, etc.) are needed, add `node_modules/foundation-sites/dist/js/foundation.min.js` (plus jQuery) to the site or copy it into a public directory and call `$(document).foundation();`.

## **Don't Forget To License The Add-Ons For Production**