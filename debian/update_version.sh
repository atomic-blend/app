#!/bin/bash

set -e

cd ..
VERSION=$(grep -E "^version:" pubspec.yaml | sed -E 's/version: ([0-9]+\.[0-9]+\.[0-9]+).*/\1/') && \
sed -i '' "s/^  Version: .*$/  Version: $VERSION/" debian/debian.yaml
VERSION=$(grep -E "^version:" pubspec.yaml | sed -E 's/version: ([0-9]+\.[0-9]+\.[0-9]+).*/\1/') && \
sed -i '' "s/^Version=.*$/Version=$VERSION/" debian/gui/atomic-task.desktop
cd -