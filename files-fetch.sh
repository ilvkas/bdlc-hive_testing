#!/usr/bin/env bash
# 2020-05, ilvkas


## ##################################################
## set config
cd $(dirname $0)
source ./config.sh

## ##################################################
## create directories
test -d ./data || mkdir ./data

## ##################################################
## get data
curl -sSLG "${disease_api_url}" | jq -c ' .diseases | . []' > data/all.json
curl -sSLG "${disease_api_url}" | jq -c ' .diseases[].name' > data/names_only.json
