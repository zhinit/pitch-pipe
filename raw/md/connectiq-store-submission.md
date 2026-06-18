# Publishing to the Connect IQ Store

Source: https://developer.garmin.com/connect-iq/submit-an-app/
Fetched: 2026-06-17

## Submission URL

https://apps.garmin.com/en-US/developer/upload

## Pre-Submission Requirements

Before uploading, developers must:

1. Configure the manifest — Ensure your app manifest identifies all
   targeted products
2. Generate the IQ file — Use the "Monkey C: Export Project" command in
   Visual Studio Code, or use monkeyc -e from the command line
3. Verify packaging — Confirm error-free generation of your app package

## Publishing Process

1. Upload your .iq file to the store for binary validation
2. Once validated, add a description and screenshots
3. Garmin reviews the app (not publicly visible during review)
4. You can preview and download your own app during review
5. Upon approval, you receive notification and the app becomes public

## Approval Timeline

- Normal: a couple of hours for non-beta app updates
- New apps: typically a couple of business days
- Apps using ANT+: longer due to ANT certification
- Delays reported up to 10+ days in rare cases

## Developer Account

Registration: https://www.garmin.com/en-US/forms/ciq-registration/
Cost: Free
