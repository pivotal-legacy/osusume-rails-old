#!/usr/bin/env bash

set -e # fail fast
set -x # expand all commands

cf push

git tag --delete staging
git push --delete origin staging

git tag staging
git push origin staging
