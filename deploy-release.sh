#!/usr/bin/env bash

ARTIFACT_PATH="$(find "$HOME/rabbitmq-public-umbrella/autocluster/dist" -maxdepth 1 -name '*.ez' | head -n 1)"
ARTIFACT_NAME="$(basename "$ARTIFACT_PATH")"

echo Installing github-release
go get github.com/aktau/github-release

echo Creating release
github-release release \
  --user "$CIRCLE_PROJECT_USERNAME" \
  --repo "$CIRCLE_PROJECT_REPONAME" \
  --tag `git describe --tags` || echo "Release already created"

echo Adding artifact tp release
github-release upload \
  --user "$CIRCLE_PROJECT_USERNAME" \
  --repo "$CIRCLE_PROJECT_REPONAME" \
  --tag  "$CIRCLE_TAG" \
  --name "$ARTIFACT_NAME" \
  --file "$ARTIFACT_PATH"
