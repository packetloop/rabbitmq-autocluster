#!/usr/bin/env bash

ARTIFACT_PATH="$(find "$HOME/rabbitmq-public-umbrella/autocluster/dist" -maxdepth 1 -name '*.ez' | head -n 1)"
ARTIFACT_NAME="$(basename "$ARTIFACT_PATH")"
echo Releasing "$ARTIFACT_PATH"
go get github.com/aktau/github-release
github-release release \
  --user "$CIRCLE_PROJECT_USERNAME" \
  --repo "$CIRCLE_PROJECT_REPONAME" \
  --tag `git describe --tags` || echo "Release already created"
github-release upload \
  --user "$CIRCLE_PROJECT_USERNAME" \
  --repo "$CIRCLE_PROJECT_REPONAME" \
  --tag `git describe --tags` \
  --name "$ARTIFACT_NAME" \
  --file "$ARTIFACT_PATH"
