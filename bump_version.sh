#!/bin/bash

current_version=$(grep 'version:' pubspec.yaml | awk '{print $2}')
echo "Current version: $current_version"

# Ask the user for the type of bump
echo "Choose the type of bump:"
echo "1) Patch"
echo "2) Minor"
echo "3) Major"
read choice

# Store the current version code from pubspec.yaml
version_code=$(echo $current_version | cut -d"+" -f2)
version_name=$(echo $current_version | cut -d"+" -f1)

# Split the version name into major, minor, and patch
IFS='.' read -r -a version_parts <<< "$version_name"
major=${version_parts[0]}
minor=${version_parts[1]}
patch=${version_parts[2]}

# Update the version according to user choice
case $choice in
  1)
    patch=$((patch + 1))
    ;;
  2)
    minor=$((minor + 1))
    patch=0
    ;;
  3)
    major=$((major + 1))
    minor=0
    patch=0
    ;;
  *)
    echo "Invalid bump type"
    exit 1
    ;;
esac

# Increment the version code
version_code=$((version_code + 1))

# Construct the new version string
new_version="$major.$minor.$patch+$version_code"

# Update the version in pubspec.yaml
sed -i '' "s/version: .*/version: $new_version/" pubspec.yaml

echo "Version updated to $new_version"

# Ask the user if they want to commit the changes
  echo "Do you want to commit the changes? (yes/no)"
  read commit_choice

  if [ "$commit_choice" == "yes" ]; then
    git add pubspec.yaml
    git commit -m "chore(app): bump version to $new_version"
    echo "Changes committed"
  else
    echo "Commit canceled"
  fi

  # Ask the user if they want to push the changes
  echo "Do you want to push the changes? (yes/no)"
  read push_choice
  if [ "$push_choice" == "yes" ]; then
    git push
    echo "Changes pushed"
  else
    echo "Push canceled"
  fi
  