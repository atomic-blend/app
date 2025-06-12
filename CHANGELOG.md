# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## 0.9.1 - 2025-06-12
#### Bug Fixes
- auto close paywall after success - (109b2ee) - Brandon Guigo
- paywall ui - (81855e4) - Brandon Guigo
- paywall start on android - (bd87105) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.0 [skip ci] - (6899624) - GitHub Actions

- - -

## 0.9.0 - 2025-06-11
#### Bug Fixes
- rendering issues on mobile for new paywall adjustments - (e7d96b1) - Brandon Guigo
- update paywall to redirect to mobile app for payment - (baeeaeb) - Brandon Guigo
- bugs on desktop for payment - (6f7f665) - Brandon Guigo
- other ui fixes + linter - (9017c6a) - Brandon Guigo
- ui of filtered view - (6f18854) - Brandon Guigo
- getUser when refresh return the same user - (91719da) - Brandon Guigo
- add refresh of user on each app layout init (ie. app startup) - (7644d04) - Brandon Guigo
- enable subscription on custom backed - (75eaae3) - Brandon Guigo
- load offerings only one time - (441e4e8) - Brandon Guigo
- ui of discount badge - (f2ebbb4) - Brandon Guigo
- refactor - (d011715) - Brandon Guigo
- paywall UI on mobile - (d659d35) - Brandon Guigo
- cancel the drag drop when it's not supported (ie device calendars) - (044b073) - Brandon Guigo
- make sidebar clearer for calendar by initialsOnly side menu items - (c3244a4) - Brandon Guigo
- ui of the duration picker - (700aa0d) - Brandon Guigo
- linter - (cd24223) - Brandon Guigo
- timer overflow on desktop - (a86d673) - Brandon Guigo
- add toast to inform of success / error when adding a task - (a367816) - Brandon Guigo
- change color of the add task btn on desktop - (7b098cc) - Brandon Guigo
- move the more button on desktop to the end of the navbar - (0bfd0c8) - Brandon Guigo
- heatmap colors didn't display - (392addc) - Brandon Guigo
- size of the reminder - (ee33691) - Brandon Guigo
- issue with icon size in primary side menu desktop - (521b858) - Brandon Guigo
- appicon not defined on android - (2897362) - Brandon Guigo
- desktop UI - (fa5c9d0) - Brandon Guigo
- linter - (64cc9b4) - Brandon Guigo
- refactor - (a4b2238) - Brandon Guigo
- bug when task_timer modal would not open in stopwatch mode - (5b72383) - Brandon Guigo
- remaining time for pomo - (cbe9438) - Brandon Guigo
- reactivity - (8aaf857) - Brandon Guigo
- timer_utils non useful async removed + add field to time_entry - (5f87cd0) - Brandon Guigo
- refactor task_timer to use timer mode enum - (8d9cdc2) - Brandon Guigo
- open the timer modal with task and mode from task details - (be37a20) - Brandon Guigo
- bug in time entry encryption + duration computation - (f9e9e77) - Brandon Guigo
- tz bug - (c4d0af0) - Brandon Guigo
- remove drawer icon on mobile for leading when there's no secondaryItems - (b2b5582) - Brandon Guigo
- show timer in a dialog or bottom modal - (7a8821b) - Brandon Guigo
- make the elevated container more elegant - (898b309) - Brandon Guigo
- linter - (661dd6d) - Brandon Guigo
- expanded but for tags page - (51ca445) - Brandon Guigo
#### Features
- redirect to mobile app on desktop for paywall - (af7b06c) - Brandon Guigo
- integrate search directly inside the page - (b0c9ec1) - Brandon Guigo
- add search page as a modal / dialog - (bb508a6) - Brandon Guigo
- enable android billing - (ccaff5e) - Brandon Guigo
- add paywall where there's a limit - (d73cb75) - Brandon Guigo
- add payment processing screen - (fb1cc2a) - Brandon Guigo
- add ui for success and validation failure - (130c919) - Brandon Guigo
- setup paywall payment steps UI - (b439e92) - Brandon Guigo
- don't show paywall when user is registered - (5072d7c) - Brandon Guigo
- manage my subscription button - (674ce41) - Brandon Guigo
- customer center - (e37e523) - Brandon Guigo
- add subscription and payment page - (90cb041) - Brandon Guigo
- add a method to check if a user have an active subscription or not - (3a69a2b) - Brandon Guigo
- trigger purchase with package - (b2b3367) - Brandon Guigo
- make yearly by default - (6f23c43) - Brandon Guigo
- be able to select a package - (8b5e356) - Brandon Guigo
- add btn ui - (3d1b50f) - Brandon Guigo
- add paywall UI - (8c9ba39) - Brandon Guigo
- add paywall structure - (edbcb5b) - Brandon Guigo
- add Purchase entity and update UserEntity to include purchases - (6fe65ef) - Brandon Guigo
- add login revenue cat + finish config - (91f2b9d) - Brandon Guigo
- configure the revenue cat sdk + paywall sdk - (a13417b) - Brandon Guigo
- add schedule view - (6dd41b8) - Brandon Guigo
- add week view - (16ebab9) - Brandon Guigo
- add resizing of a task in calendar - (6923c20) - Brandon Guigo
- add drag task to move it - (940cf59) - Brandon Guigo
- be able to create a task directly from the calendar - (736ba11) - Brandon Guigo
- add ask buttons on overview sections - (1cfd810) - Brandon Guigo
- be able to delete an habit - (37d38d4) - Brandon Guigo
- ui for paused timers - (1ac04ba) - Brandon Guigo
- add pomo container at top of overview when running - (2001b5b) - Brandon Guigo
- make the search of a task work - (de1848b) - Brandon Guigo
- add label to btn - (51fed02) - Brandon Guigo
- add a btn for pomo break start - (e398cd7) - Brandon Guigo
- set the duration of break pomo - (66669ae) - Brandon Guigo
- add clear btn to unselect the task - (6557d8a) - Brandon Guigo
- show the stopwatch completed modal - (151819c) - Brandon Guigo
- send to backend the time entry for stopwatch when stopped - (f4a1a17) - Brandon Guigo
- move time entries to it's own bloc and own state - (8f2d7d1) - Brandon Guigo
- store time entry without task inside a collection - (5f20bdb) - Brandon Guigo
- add log entry type to log list - (1032192) - Brandon Guigo
- update model of time entry to have duration - (79cb3aa) - Brandon Guigo
- completed timer modal and watcher - (d6fed55) - Brandon Guigo
- add timer_watcher modal - (0e2a41e) - Brandon Guigo
- add remaining interactions - (b132de4) - Brandon Guigo
- start pause with ui reaction - (b260cfd) - Brandon Guigo
- add reactions to timer utils changes - (f9933fb) - Brandon Guigo
- insert time utils in ui - (b1533fd) - Brandon Guigo
- add methods to timer_utils + remove bad code - (0e604ae) - Brandon Guigo
- store and update pomo duration - (b92ffb2) - Brandon Guigo
- stopwatch ui - (2ba7235) - Brandon Guigo
- add task selector - (0b9f199) - Brandon Guigo
- add mode selector - (788531a) - Brandon Guigo
- add stopwatch methods - (6072877) - Brandon Guigo
- add timer utils + list of stuff to do - (11ed31e) - Brandon Guigo
- open the timer modal from task details - (ffdd340) - Brandon Guigo
- ui of the timer / pomo page - (376fbdc) - Brandon Guigo
- add timer page - (416c177) - Brandon Guigo
- add inbox view + dix darkmode issues - (505ab3b) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.8.0 [skip ci] - (940031a) - GitHub Actions

- - -

## 0.8.0 - 2025-05-23
#### Bug Fixes
- last ui adjustments - (757f39a) - Brandon Guigo
- ui for desktop - (203404f) - Brandon Guigo
- redo the ui for the folder picker - (4dc0a89) - Brandon Guigo
- edit of a folder works - (1351dbb) - Brandon Guigo
- folderId instead of folder in task entity - (ee8f5dc) - Brandon Guigo
- color of the add btn - (d92cbaf) - Brandon Guigo
- folders endpoint can return null if there's no data - (eca0933) - Brandon Guigo
- ui of habits - (5720033) - Brandon Guigo
- some ui of the create habit modal - (89ca027) - Brandon Guigo
- task details elevated containers - (0d41b4f) - Brandon Guigo
- spacing on desktop more page - (2ddee22) - Brandon Guigo
- more ui + bottom nav border on mobile - (5651dfe) - Brandon Guigo
- drag task item msising style for date when dragged - (fa66487) - Brandon Guigo
- use elevated container to give the UI some vibrance - (db8eb57) - Brandon Guigo
- priority picker dark mode issue - (c1cda1a) - Brandon Guigo
- more screen and tags page padding - (6d0254a) - Brandon Guigo
- paddings - (4749e43) - Brandon Guigo
- calendar cell border depending on dark mode - (342efd9) - Brandon Guigo
- colors for side nav - (acb669f) - Brandon Guigo
- invert colors of surface and surfaceContainer - (550777b) - Brandon Guigo
- ui of the overview screen - (65b46f7) - Brandon Guigo
- desktop ui for priority picker - (2f26d93) - Brandon Guigo
- calendar settings into dialog for desktop - (4211f89) - Brandon Guigo
- padding on calendar settings - (4a2cc29) - Brandon Guigo
- change add button color to be less bright - (e129796) - Brandon Guigo
- add account button in the more screen - (b8dc21a) - Brandon Guigo
- more apps spacing - (9d1cee9) - Brandon Guigo
- ui of the events - (02dac32) - Brandon Guigo
- side menu broken on desktop + tags container expanded - (8f45fae) - Brandon Guigo
- colors of the side menu item border too dark - (243412d) - Brandon Guigo
- use cupertino icons in side navigation - (6e80786) - Brandon Guigo
- calendar color - (04147a0) - Brandon Guigo
- open task detail in a dialog on mac os - (d93f18d) - Brandon Guigo
- ui enhancement on task details - (725fd62) - Brandon Guigo
- update ui for tags view - (dc3cf46) - Brandon Guigo
- update ui of filtered view - (ef4275c) - Brandon Guigo
- move the misplaced buildTaskDateInfo in TaskItem - (02f4588) - Brandon Guigo
- overview screen UI - (41d3772) - Brandon Guigo
- linter - (fdec7c1) - Brandon Guigo
- localize - (ef75b79) - Brandon Guigo
- display toast when clicking on not available features - (ec481dc) - Brandon Guigo
- use grid to display the action buttons on tasks - (5d49509) - Brandon Guigo
- make task entry reactive to change + auto close - (9e5f01e) - Brandon Guigo
- move the button to access time entry - (f4a8902) - Brandon Guigo
- expanded that causes crash on task date in release mode - (63d09bb) - Brandon Guigo
- ui on desktop - (17f991d) - Brandon Guigo
- display toolbar in top of keyboard on mobile - (dfd24c3) - Brandon Guigo
- ui with virtual keyboard - (f4be23e) - Brandon Guigo
- hide completed tasks in eisenhower matrix - (f4d6323) - Brandon Guigo
- move more appbar at the end on desktop - (e77aec9) - Brandon Guigo
- bug on navigationRail for desktop where add button didn't work - (fdacd5a) - Brandon Guigo
- don't display completed tasks in tags view - (b9f5daf) - Brandon Guigo
- linter - (8052d30) - Brandon Guigo
- move the more button at the end of the list on desktop - (fccaf46) - Brandon Guigo
- some ui on desktop - (4a5fda6) - Brandon Guigo
- collapsed ui for the task item to be used in eisenhower - (d4309ed) - Brandon Guigo
- linter issues - (e26ce4f) - Brandon Guigo
- desktop issues - (421b762) - Brandon Guigo
- task item size - (0c67d8d) - Brandon Guigo
#### Features
- add folders to the side menu - (9e4e116) - Brandon Guigo
- setup app_layout refactor - (ceb8498) - Brandon Guigo
- set tag from add task modal - (12bb009) - Brandon Guigo
- be able to set / unset folder inside add_task_modal - (1d2892f) - Brandon Guigo
- be able to remove a folder from a task - (39fa126) - Brandon Guigo
- be able to set and edit folder on a task in task detail - (f186222) - Brandon Guigo
- delete folder - (5891ff0) - Brandon Guigo
- creation of a folder working - (b4eec27) - Brandon Guigo
- add my folders management modal - (b51bdd4) - Brandon Guigo
- finish folder page rebrand - (f20a124) - Brandon Guigo
- create folder bloc - (483f7cf) - Brandon Guigo
- add folder screen - (cd097d1) - Brandon Guigo
- add folder entity to task - (553f101) - Brandon Guigo
- add and delete of time entry works - (1159302) - Brandon Guigo
- add time entry logs + actions on task details - (7fc7741) - Brandon Guigo
- make the form and fields working - (5328c84) - Brandon Guigo
- setup the modal to manually add time spend - (ba05e30) - Brandon Guigo
- display list of entries in task detail - (1ce8deb) - Brandon Guigo
- add time entry to task entity - (cb1d4ef) - Brandon Guigo
- add notes with fleather plugin - (6632f92) - Brandon Guigo
- add separator before option to side menu item - (9df899f) - Brandon Guigo
- add completed and all tasks views - (907824e) - Brandon Guigo
- same for habit view - (859cf9a) - Brandon Guigo
- add refresh on pull inside tasks views - (eab9fa5) - Brandon Guigo
- disable slideable in eisenhower - (ed0b486) - Brandon Guigo
- plus button on eisen cards so user can add directly into the category - (c4815d4) - Brandon Guigo
- update date when user move task + ui fixes - (8251f1b) - Brandon Guigo
- add drag and drop of tasks to change prio - (2e8fdd8) - Brandon Guigo
- display tasks in matrix - (8b17c23) - Brandon Guigo
- add title on eisenhower cards - (ae7852e) - Brandon Guigo
- setup eisenhower matrix - (6cddc20) - Brandon Guigo
- display color of priority in calendar event for task - (d402d66) - Brandon Guigo
- select priority in add task modal - (d51828c) - Brandon Guigo
- refactor + add in task modal - (2bf89cc) - Brandon Guigo
- display priority in task item - (7394f88) - Brandon Guigo
- be able to change the priority from task detail - (8af0638) - Brandon Guigo
- display priority in task detail - (e7686eb) - Brandon Guigo
- add priority field to task entity - (58985d0) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.7.6 [skip ci] - (e7ee9a0) - GitHub Actions
- add innosetup config for windows installer [skip ci] - (924d642) - Brandon Guigo

- - -

## 0.7.6 - 2025-05-15
#### Bug Fixes
- add support for Windows - (be25472) - Brandon Guigo
- disable firebase messaging for linux app since not compatible - (46cec8c) - brandonguigo
#### Miscellaneous Chores
- **(release)** 0.7.5 [skip ci] - (2cfd160) - GitHub Actions

- - -

## 0.7.5 - 2025-05-15
#### Bug Fixes
- support mac designed for iPad - (0323455) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.7.4 [skip ci] - (dbdac0c) - GitHub Actions

- - -

## 0.7.4 - 2025-05-15
#### Bug Fixes
- add safe area - (b54b310) - Brandon Guigo
- support iPad as desktop screen - (d954e99) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.7.3 [skip ci] - (1025f97) - GitHub Actions

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