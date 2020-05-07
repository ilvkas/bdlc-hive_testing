#!/usr/bin/env bash
# 2020-05, ilvkas

## ##################################################
## set config
cd $(dirname $0)
source ./config.sh

## ##################################################
## push files to hdfs
hdfs dfs -put -f data/all.json               /user/${USER}/load/
