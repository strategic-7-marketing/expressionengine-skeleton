# ExpressionEngine Skeleton With Tailwind

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

Included in an .htaccess_LIVE file that if used should be configured for the production domain. "APEXDOMAIN" in .htaccess_LIVE should be replaced with the actual apex or naked domain name. This file is intended to be used with GitHub Actions to streamline deployment to the production server. For example using the following Deploy Via FTP action which will deploy the site when the main branch is comitted to the configured FTP server secrets (FTP_SERVER, FTP_USERNAME, and FTP_PASSWORD) furthermore it will delete any .htaccess file on the server and rename .htaccess_LIVE to .htaccess to take its place.

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
    - uses: actions/checkout@v3
      with:
        fetch-depth: 2
    - name: FTP-Deploy-Action
      uses: SamKirkland/FTP-Deploy-Action@4.3.3
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

### Preconfigurtations

- Added default additional menu items for Structure and Template Manager in the EE backend dashboard.

## Front-end Framework Branches.

- Bootstrap branch includes an NPM package for Bootstrap and preconfiguration for using Bootstrap Front-end.

- Foundation branch includes an NPM package for Foundation and preconfiguration for using Foundation Front-end.

- Tailwind branch includes an NPM package for Tailwind and preconfiguration for using Tailwind.

## Using Tailwind
Tailwind is preconfigured to watch the `/system/user/templates/` directory to build the CSS. Modify the `tailwind.config.js` if other locations are required.

To begin watching for changes run: `npx tailwindcss -i ./css/styles.css -o ./css/styles.min.css --watch`

## **Don't Forget To License The Add-Ons For Production**