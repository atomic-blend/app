#!/bin/bash
# Usage: ./release_beta.sh [flavor]


# Get the current branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Check if the current branch is 'main'
if [ "$current_branch" == "main" ]; then
  echo "You are on the main branch."
else
  echo "You are not on the main branch. Current branch is $current_branch."
  echo "Checking out main branch..."
  git checkout main
fi

# Pull the latest changes from the remote main branch
echo "Pulling the latest changes from the remote main branch..."
git pull origin main

# Present the git history to the user and ask for confirmation
echo "Here is the git history:"
git log --oneline --graph --decorate
read -r -p "Do you want to continue with the release beta script? [y/N] " response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Release beta script aborted."
  exit 0
fi

echo "Running release beta script into ./fastlane ..."
cd fastlane || exit 1

# Run the fastlane beta lane
echo "Running fastlane beta lane for iOS..."
fastlane ios beta || exit 1
echo "Running fastlane beta lane for Android..."
fastlane android beta || exit 1

echo "Release beta script completed."
echo "TestFlight: https://appstoreconnect.apple.com/teams/bbdf1f5a-e8bb-4cfb-aee3-a23eab5b3532/apps/6736610391/testflight/ios"
echo "PlayConsole: https://play.google.com/console/u/0/developers/8894761878719221790/app/4975797716433348269/publishing"


