#!/bin/bash

set -e
set -u

GIT_ROOT=$(git rev-parse --show-toplevel)

SITE="dpa"

terminus site:list --format=json | tee ${GIT_ROOT}/site-list.json

cat ${GIT_ROOT}/site-list.json | jq > ${GIT_ROOT}/site-list.pretty.json

mv ${GIT_ROOT}/site-list.pretty.json ${GIT_ROOT}/site-list.json
