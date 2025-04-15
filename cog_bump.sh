#!/bin/bash

current_version=$(grep 'version:' pubspec.yaml | awk '{print $2}')
echo "Current version: $current_version"

# Store the current version code from pubspec.yaml
version_code=$(echo $current_version | cut -d"+" -f2)
# Increment the version code
version_code=$((version_code + 1))

# Construct the new version string
new_version="$1+$version_code"

# Update the version in pubspec.yaml
sed "s/version: .*/version: $new_version/" pubspec.yaml > temp.yaml && mv temp.yaml pubspec.yaml

echo "Version updated to $new_version"
