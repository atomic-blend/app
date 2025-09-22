# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## 0.12.11 - 2025-09-22
#### Bug Fixes
- update flutter_dependencies - (c0efcee) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.10 [skip ci] - (3887c6a) - GitHub Actions

- - -

## 0.12.10 - 2025-09-22
#### Bug Fixes
- update wrong path of keyfile - (5cd0da1) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.9 [skip ci] - (8e35b0e) - GitHub Actions

- - -

## 0.12.9 - 2025-09-22
#### Bug Fixes
- android kotlin compose missing a pluggin for new kotlin update - (dd9cd96) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.8 [skip ci] - (2d904ca) - GitHub Actions

- - -

## 0.12.8 - 2025-09-22
#### Bug Fixes
- bad docker image name - (aa6a0b0) - Brandon Guigo
- add new main cicd script that builds all platforms - (27ec235) - Brandon Guigo
- bump flutter version in build test - (636008b) - Brandon Guigo
- update fastfile - (8c19bb1) - Brandon Guigo
- make it run for macos - (db2bfc7) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.7 [skip ci] - (53a076c) - GitHub Actions
- fix the creation of the dart files from secret in GH for config [skip ci] - (6f6180b) - Brandon Guigo

- - -

## 0.12.7 - 2025-09-15
#### Bug Fixes
- add missing setup-flutter step in build web - (bfbfa06) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.6 [skip ci] - (d337eab) - GitHub Actions

- - -

## 0.12.6 - 2025-09-15
#### Bug Fixes
- build flutter web before creating the docker images - (66c4708) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.5 [skip ci] - (85cbcfc) - GitHub Actions

- - -

## 0.12.5 - 2025-09-15
#### Bug Fixes
- restrict docker build to high memory runners - (6764a5b) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.4 [skip ci] - (5aad96e) - GitHub Actions

- - -

## 0.12.4 - 2025-09-15
#### Bug Fixes
- update shared package to latest - (373d343) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.3 [skip ci] - (80aaedd) - GitHub Actions
- use a matric to build docker images so one runner builds one image - (847d2f3) - Brandon Guigo

- - -

## 0.12.3 - 2025-09-15
#### Bug Fixes
- update cicd to use new self hosted runners - (39edd07) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.2 [skip ci] - (0c6fc0d) - GitHub Actions

- - -

## 0.12.2 - 2025-09-13
#### Bug Fixes
- update script that copy the options - (cf34f34) - Brandon Guigo
- update the cicd script to create the necessary config at build time - (feb8143) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.1 [skip ci] - (42d62c7) - GitHub Actions

- - -

## 0.12.1 - 2025-09-13
#### Bug Fixes
- update to the new navbar - (75eabdf) - Brandon Guigo
- test script for path dependency with correct yaml indentation matching - (7db2f18) - Brandon Guigo
- get dependencies before pub get in pipeline - (504ac59) - Brandon Guigo
- cicd local path check script - (ba99f36) - Brandon Guigo
- update shared to the latest version - (fa85a32) - Brandon Guigo
- use shared sync entities - (ae639db) - Brandon Guigo
- update flutter_age - (ff6e0a7) - Brandon Guigo
- clean translation files - (25c30eb) - Brandon Guigo
- replace ab_modal by shared version - (df19be2) - Brandon Guigo
- use shared components more - (3a0a433) - Brandon Guigo
- replace navbar with shared component - (f370f64) - Brandon Guigo
- replace last utils with shared - (f440d25) - Brandon Guigo
- replace the account pages with shared - (0dd85c7) - Brandon Guigo
- replace the auth screens with the shared ones - (f15070e) - Brandon Guigo
- migrate auth bloc to shared package - (f857afb) - Brandon Guigo
- replace revenue cat service by shared - (5cab78a) - Brandon Guigo
- use shared device info service - (91c7c46) - Brandon Guigo
- use shared fcm service - (517d87c) - Brandon Guigo
- add actions test to check that there's no local dependencies for the app - (52cf1bc) - Brandon Guigo
- crash on web because of encryption service init even when user's not logged in - (4f1082c) - Brandon Guigo
- replace the encryption service and model with the shared one - (d2d4fb6) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.12.0 [skip ci] - (03ca2b3) - GitHub Actions
- update the gh actions main to build and push image via dockerx - (3d92100) - Brandon Guigo
- update the dockerfile for web wasm - (0ac11fe) - Brandon Guigo

- - -

## 0.12.0 - 2025-07-30
#### Bug Fixes
- flutter version and readme file for pkg - (c37b209) - Brandon Guigo
- bug with login and key restoration - (1b20a22) - Brandon Guigo
- use utf8 encode for private key encryption - (e9b3d8f) - Brandon Guigo
#### Features
- convert the data key form aes to age - (f1c9d1d) - Brandon Guigo
- add public key to model + make json encryption easier - (ea42a8a) - Brandon Guigo
- support wasm - (0f8cc88) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.11.0 [skip ci] - (40887e4) - GitHub Actions

- - -

## 0.11.0 - 2025-07-10
#### Bug Fixes
- linter issues - (bf63b4c) - Brandon Guigo
- exception when validating or discarding the last conflict - (2a7aef1) - Brandon Guigo
- encrypt patch before sending in a separate list - (b165518) - Brandon Guigo
- refactor with grid - (a42f4af) - Brandon Guigo
- set state happening on the last patch to apply - (e5875e5) - Brandon Guigo
- various fixes for linter - (7af407b) - Brandon Guigo
- refactor translations + add progress bar - (7d1119f) - Brandon Guigo
- a bit of refactoring - (1839954) - Brandon Guigo
- global layout of the resolve conflict page - (0bd941a) - Brandon Guigo
- remove the conflicts property since we store it in latestSync - (0ffdfd5) - Brandon Guigo
- ui of sync page - (dfc273a) - Brandon Guigo
- apply patch immediatly on state - (cc7de49) - Brandon Guigo
- task creation with patch - (20e931c) - Brandon Guigo
- make edit descr and title working - (f419706) - Brandon Guigo
- remove old updateBulk that don't works well - (ef44757) - Brandon Guigo
- required id for patch + generate objectid for patch - (91c0c3f) - Brandon Guigo
- add missing components - (8f6d365) - Brandon Guigo
- sync adjustment - (ab28619) - Brandon Guigo
- remove unused methods in task service - (b3be7d0) - Brandon Guigo
- availability version - (33550af) - Brandon Guigo
- set app group id in main when app starts - (263cb16) - Brandon Guigo
#### Features
- refactor delete confirm into a generic one - (355e520) - Brandon Guigo
- add apply / discard calls to bloc - (acb70f8) - Brandon Guigo
- add apply all checkbox - (64e57ba) - Brandon Guigo
- display the patch changes in the conflict resolver - (2ffe45c) - Brandon Guigo
- add some ui - (86c2cc1) - Brandon Guigo
- add force apply / discard patch - (c15dfd0) - Brandon Guigo
- add list of changes + buttons - (c3d143a) - Brandon Guigo
- conflict resolver start of ui - (b202355) - Brandon Guigo
- setup conflict resolver - (7e6e77b) - Brandon Guigo
- add conflict card to other pages - (61e9652) - Brandon Guigo
- display conflict card on overview page - (59f9b12) - Brandon Guigo
- start of conflict card - (78b8707) - Brandon Guigo
- delete task with patch work - (bbd5b01) - Brandon Guigo
- send update patch to backend ok - (bcfb3dd) - Brandon Guigo
- replace all task edits by a list of changes - (86d2625) - Brandon Guigo
- new patch model creation - (26a5c51) - Brandon Guigo
- sync status page for tasks working - (38fd22c) - Brandon Guigo
- next of sync status modal ui - (baae697) - Brandon Guigo
- start syncStatus modal + conflicted wrapper etc... - (68d14bb) - Brandon Guigo
- run sync on 5 min cron + fix issue with appGroupId don't set in main - (d5a9493) - Brandon Guigo
- update task via sync mechanism - (25e9bcf) - Brandon Guigo
- add sync Tasks with conflicts - (79a92bc) - Brandon Guigo
- add optional batchSize parameter - (df15bf4) - Brandon Guigo
- add update bulk method - (0771bb1) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.10.0 [skip ci] - (766260c) - GitHub Actions
- fix fastfile + ios project for widget [skip ci] - (bc91497) - Brandon Guigo

- - -

## 0.10.0 - 2025-06-30
#### Bug Fixes
- add free tier text - (6f71c5e) - Brandon Guigo
- linter - (fe63bfb) - Brandon Guigo
- android widget size - (77e6c57) - Brandon Guigo
- some padding on Android Widget - (bbe8260) - Brandon Guigo
- size of the task title - (464a1d5) - Brandon Guigo
- task parsing - (a66667c) - Brandon Guigo
- update widget on iOS - (67642a3) - Brandon Guigo
- translations - (2ae234f) - Brandon Guigo
#### Features
- add basic ui v1 - (3f01775) - Brandon Guigo
- configure android widget - (0220336) - Brandon Guigo
- add premium required message - (24c8770) - Brandon Guigo
- add no task message in widget - (4be35a2) - Brandon Guigo
- add app groups and first UI of widget - (a9bd1b7) - Brandon Guigo
- send data using home_widget to the iOS widget - (4f015dd) - Brandon Guigo
- widget extension on flutter finally working - (76a4581) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.8 [skip ci] - (c0244d2) - GitHub Actions

- - -

## 0.9.8 - 2025-06-28
#### Bug Fixes
- missing translation for subscription page - (7ddd4c8) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.7 [skip ci] - (def4eb7) - GitHub Actions

- - -

## 0.9.7 - 2025-06-27
#### Bug Fixes
- paywall ui to emphasis billed price + free tial - (dab4cae) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.6 [skip ci] - (5f83f83) - GitHub Actions

- - -

## 0.9.6 - 2025-06-25
#### Bug Fixes
- login modal size on desktop - (06fa7ef) - Brandon Guigo
- side menu max width - (235b5ad) - Brandon Guigo
- display link to other apps when app is running on unsupported payment - (ebec963) - Brandon Guigo
- web issue - (62de965) - Brandon Guigo
- argon2 work on web - (a0b6a93) - Brandon Guigo
- web compilation error - (3636a93) - Brandon Guigo
- safe area missing - (60e0204) - Brandon Guigo
- add clear btn in folder selection - (bef5619) - Brandon Guigo
- select folder bug - (d2119a4) - Brandon Guigo
- date picker on big screens - (5c8ffbc) - Brandon Guigo
- task detail overflow - (a040af3) - Brandon Guigo
- display of event calendar - (1e348cd) - Brandon Guigo
- issues with calendar item tap - (f4a44f8) - Brandon Guigo
- mnemonic ui - (6393b9d) - Brandon Guigo
- login page + loading - (785d7ab) - Brandon Guigo
- login or register ui - (fc6049f) - Brandon Guigo
- ui of login welcome screen - (e410235) - Brandon Guigo
- purchases on iPad and paywall ui fixes - (2d0a576) - Brandon Guigo
- update usage string in app info.plist - (1895de4) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.5 [skip ci] - (a9059f3) - GitHub Actions

- - -

## 0.9.5 - 2025-06-24
#### Bug Fixes
- trigger new version for app store publishing - (3ac07a6) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.4 [skip ci] - (868d5f0) - GitHub Actions

- - -

## 0.9.4 - 2025-06-18
#### Bug Fixes
- wrong condition on RC init in main - (54c7be0) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.3 [skip ci] - (74abb09) - GitHub Actions

- - -

## 0.9.3 - 2025-06-17
#### Bug Fixes
- remove restore purchase btn - (2c73541) - Brandon Guigo
- linter - (743e96c) - Brandon Guigo
- change urls of privacy and terms - (54aa09c) - Brandon Guigo
- fastlane build command issue when publishing for iOS - (cb42c39) - Brandon Guigo
- remove android reference from inside the app UI - (dd95061) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.2 [skip ci] - (dbdcabb) - GitHub Actions

- - -

## 0.9.2 - 2025-06-13
#### Bug Fixes
- linter - (7a1e6a2) - Brandon Guigo
- enable all payment actions only on iOS and Android - (5b79378) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** 0.9.1 [skip ci] - (10671ad) - GitHub Actions

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