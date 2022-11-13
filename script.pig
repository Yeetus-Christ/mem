--CREATING A RELATION BY LOADING USER DATA FILE
users = LOAD '/user/maria_dev/pig/data.csv' 
USING PigStorage(',') 
AS (ID:int, author:chararray, title:chararray, description:chararray, url:chararray, urlToImage:chararray, publishedAt:chararray, content:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE users INTO 'hbase://data' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('ID:int, author:chararray, title:chararray, description:chararray, url:chararray, urlToImage:chararray, publishedAt:chararray, content:chararray');
