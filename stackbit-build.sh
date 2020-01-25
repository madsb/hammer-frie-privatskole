#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e2bd41df7df72001becf76a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e2bd41df7df72001becf76a
curl -s -X POST https://api.stackbit.com/project/5e2bd41df7df72001becf76a/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e2bd41df7df72001becf76a/webhook/build/publish > /dev/null
