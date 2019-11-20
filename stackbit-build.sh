#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd5351caac7e400194afbad/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd5351caac7e400194afbad
curl -s -X POST https://api.stackbit.com/project/5dd5351caac7e400194afbad/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dd5351caac7e400194afbad/webhook/build/publish > /dev/null
