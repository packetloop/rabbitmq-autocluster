#!/usr/bin/env bash

ARTIFACT_PATH="$HOME/rabbitmq-public-umbrella/autocluster/dist/autocluster-0.0.0.ez"
ARTIFACT_NAME="autocluster-$CIRCLE_TAG.ez"

echo Installing github-release
go get github.com/aktau/github-release

echo Creating release
github-release release \
  --user "$CIRCLE_PROJECT_USERNAME" \
  --repo "$CIRCLE_PROJECT_REPONAME" \
  --tag "$CIRCLE_TAG" || echo "Release $CIRCLE_TAG already created"

echo Adding artifact tp release
github-release upload \
  --user "$CIRCLE_PROJECT_USERNAME" \
  --repo "$CIRCLE_PROJECT_REPONAME" \
  --tag  "$CIRCLE_TAG" \
  --name "$ARTIFACT_NAME" \
  --file "$ARTIFACT_PATH"

echo "Release $CIRCLE_TAG successful"
