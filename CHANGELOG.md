# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## 0.7.3 - 2025-05-14
#### Bug Fixes
- fastfile - (41939ae) - Brandon Guigo
- comment web release in cicd since pointy castle argon2 is not web compatible - (79f3156) - Brandon Guigo
- github pipeline + html quotes - (6019641) - Brandon Guigo
- html error - (1a6fd6d) - Brandon Guigo
- linter - (a1b448c) - Brandon Guigo
- add cicd for web build and deployment to ecs - (4d85fa1) - Brandon Guigo
- add habit in a dialog on desktop - (eea83c3) - Brandon Guigo
- date picker desktop ui better - (68671ce) - Brandon Guigo
- overflow of task date picker - (2e90414) - Brandon Guigo
- add task modal in dialog - (f757b0e) - Brandon Guigo
- update mac os app name - (b394b24) - Brandon Guigo
- mac os dmg generator working - (43016e2) - Brandon Guigo
- update mac app name + add debian script to refresh release version config - (b5fb204) - Brandon Guigo
- add mac os dmg generation - (1d88d14) - Brandon Guigo
- add support for iPad - (800134e) - Brandon Guigo
- configure fastlane for web linux and macos - (3c19e22) - Brandon Guigo
- min mac os window size + side menu fixed size - (6448de0) - Brandon Guigo
- errors for web - (9df8280) - Brandon Guigo
- avatar text on mobile - (b18f729) - Brandon Guigo
- mac os utils only for mac - (d4e92a1) - Brandon Guigo
- habit image size - (c6b1c40) - Brandon Guigo
- make mac os window transparent - (a094d10) - Brandon Guigo
- various desktop enhancements - (a5b970d) - Brandon Guigo
- use a double side rail in desktop - (20ddb57) - Brandon Guigo
- add appbar - (211589e) - Brandon Guigo
- desktop bottom nav bar - (b41c4e6) - Brandon Guigo
- make 2 rendering logic for app_wrapper depending on desktop or mobile - (b40c8bd) - Brandon Guigo
- web deprecations - (b143616) - Brandon Guigo
- platform errors for web - (76f4e11) - Brandon Guigo
- loading screen - (9407440) - Brandon Guigo
- mnemonic key - (2b24d4c) - Brandon Guigo
- register password screen - (0421be9) - Brandon Guigo
- login screen - (50f4dd7) - Brandon Guigo
- login or register step - (ebef5ae) - Brandon Guigo
- adapt welcome screen to desktop - (f0b6baa) - Brandon Guigo
- mac os app icon - (45ad92a) - Brandon Guigo
- be able to run on mac OS with firebase messaging - (f99035e) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.7.2 [skip ci] - (8d42a6e) - GitHub Actions

- - -

## 0.7.2 - 2025-05-12
#### Bug Fixes
- email validation - (b5ecdb7) - Brandon Guigo
- add validation on password length in register - (3b4658e) - Brandon Guigo
- add margin - (5ee521a) - Brandon Guigo
- android samsung phones keyboard problem - (8a6db22) - muhsinkutay
- test commit for ci in a forked branch - (a0b6746) - Brandon Guigo
- for the text becoming invisible when using app in dark mode in Android - (f0d877b) - muhsinkutay
- for the text becoming invisible when using phone in dark mode in Android - (db3fbdc) - muhsinkutay
- for the text becoming invisible when using phone in dark mode in Android - (2df71a5) - muhsinkutay
#### Miscellaneous Chores
- **(release)** 0.7.1 [skip ci] - (b37104b) - CircleCI
- fix ci - (04251b2) - Brandon Guigo
- add main.yml pipeline - (985631c) - Brandon Guigo
- gh action workflow test - (217c436) - Brandon Guigo
- fastfile [skip ci] - (14c6af1) - Brandon Guigo

- - -

## 0.7.1 - 2025-04-28
#### Bug Fixes
- linter - (0904340) - Brandon Guigo
- wrong app name - (8b2e000) - Brandon Guigo
- request calendar permission in calendar page initState - (a3dd6ec) - Brandon Guigo
- change name, icon and splash - (f611107) - Brandon Guigo
- login / out user in Sentry also - (f138c15) - Brandon Guigo
- configure sentry so future bugs are reported - (4c210f9) - Brandon Guigo
- null check on a null value error + internationalization error - (5dcf29d) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.7.0 [skip ci] - (129aa9e) - CircleCI
- fix fastfile and appfile to have env var in fastlane [skip ci] - (3b7363d) - Brandon Guigo

- - -

## 0.7.0 - 2025-04-25
#### Bug Fixes
- trigger cicd - (0d401bf) - Brandon Guigo
- linter issues - (3760622) - Brandon Guigo
- display of the single date picker time - (60198c3) - Brandon Guigo
- display a red container over due date when task is overdue - (0bc55e0) - Brandon Guigo
- be able to set an endTime without a precise time (day task) - (a816427) - Brandon Guigo
- linter issues - (fce3a60) - Brandon Guigo
- hide sidebar when there's no side item in it - (6d23958) - Brandon Guigo
#### Features
- finish the reset password with mnemonic restore - (ca7aa9b) - Brandon Guigo
- decrypt data key with mnemonic and generate a new keyset from existing data key - (e6f24a8) - Brandon Guigo
- generate the new keyset + use keyset in payload when restoreData is false - (8da22b6) - Brandon Guigo
- add bloc event to confirm pwd reset - (f0d42ff) - Brandon Guigo
- add the recap of the reset password request - (8e709c3) - Brandon Guigo
- add set the new password step - (e58a505) - Brandon Guigo
- add user choice for backup key restore or new data - (51d9197) - Brandon Guigo
- add reset password intro screen with email + send req to backend + enter confirmation code screen - (10b5658) - Brandon Guigo
- add reset password intro screen - (ab94e5d) - Brandon Guigo
- change password working - (3c95605) - Brandon Guigo
- generate the new encryption key before sending to backend - (c8fbb5c) - Brandon Guigo
- add a refreshUserDataKey method - (50c26ac) - Brandon Guigo
#### Miscellaneous Chores
- add dev pipeline [skip ci] - (cc5e9c5) - Brandon Guigo

- - -

## 0.4.5 - 2025-04-16
#### Bug Fixes
- restore the changelog in the create gh release job - (6a19889) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.4.4 [skip ci] - (eec85fb) - CircleCI

- - -

## 0.4.4 - 2025-04-15
#### Bug Fixes
- try persisting changelog file for gh release step - (184bd0e) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.4.3 [skip ci] - (9f58d7c) - CircleCI

- - -

## 0.4.3 - 2025-04-15
#### Bug Fixes
- remove go cache - (7a1dd89) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.4.2 [skip ci] - (30ea2e7) - CircleCI

- - -

## 0.4.2 - 2025-04-15
#### Bug Fixes
- add missing orb for gh release - (fd58e4e) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.4.1 [skip ci] - (12de134) - CircleCI

- - -

## 0.4.1 - 2025-04-15
#### Bug Fixes
- add gh release creation - (d889a66) - Brandon Guigo

- - -

Changelog generated by [cocogitto](https://github.com/cocogitto/cocogitto).