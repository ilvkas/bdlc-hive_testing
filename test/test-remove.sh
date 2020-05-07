#!/usr/bin/env bash
# 2019-05, Bruno Grossniklaus, https://github.com/it-gro

cd $(dirname $0)
source ./config.sh

hive_cli -f drop.sql

hdfs dfs -ls -R ${ts_ext}/openaq_org_ext.db
hdfs dfs -rm -r ${ts_ext}/openaq_org_ext.db/*
hdfs dfs -ls -R ${ts_ext}/openaq_org_ext.db

hive_cli <<EOSQL
  show databases;
EOSQL

hdfs dfs -ls ${ts_ext}/
#hdfs dfs -rmdir ${ts_ext}/openaq_org_ext.db
