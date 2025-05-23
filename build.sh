#!/bin/sh -eu

cd /app

git fetch origin

if git status | grep -q behind; then
  git merge origin/main

  npm ci
  npm run build
fi
