#!/usr/bin/env bash
# 2019-05, Bruno Grossniklaus, https://github.com/it-gro

cd $(dirname $0)
source ./config.sh

hive_cli -f create.sql

hdfs dfs -ls -R ${ts_ext}/openaq_org_ext.db
zcat ../../data/*.gz |
  grep -v "location,city,country,utc,local,parameter,value,unit,latitude,longitude,attribution" |
  bzip2 |
  hdfs dfs -put -f - ${ts_ext}/openaq_org_ext.db/openaq/data.csv.bz2

hdfs dfs -ls -R ${ts_ext}/openaq_org_ext.db
