CREATE DATABASE openaq_org_ext;
use openaq_org_ext;

CREATE EXTERNAL TABLE openaq (
      location          STRING
    , city              STRING
    , country           STRING
    , date_utc          STRING
    , date_local        STRING
    , parameter         STRING
    , value             FLOAT
    , unit              STRING
    , latitude          FLOAT
    , longitude         FLOAT
    , attribution       ARRAY<STRUCT<name:STRING,url:STRING>>
  )
  COMMENT 'grep -v, OpenCSVSerde, ARRAY<STRUCT<name:STRING,url:STRING>>'
  ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  STORED AS TEXTFILE
;
