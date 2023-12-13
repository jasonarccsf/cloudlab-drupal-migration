#!/bin/bash

set -e
set -u

GIT_ROOT=$(git rev-parse --show-toplevel)

SITE="dpa"

terminus site:info ${SITE} --format=json | tee ${GIT_ROOT}/${SITE}-site-info.json

cat ${GIT_ROOT}/${SITE}-site-info.json | jq > ${GIT_ROOT}/${SITE}-site-info.pretty.json

mv ${GIT_ROOT}/${SITE}-site-info.pretty.json ${GIT_ROOT}/${SITE}-site-info.json
