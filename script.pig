--CREATING A RELATION BY LOADING USER DATA FILE
data = LOAD '/user/maria_dev/pig/data.csv' 
USING PigStorage(',') 
AS (id:chararray, author:chararray, title:chararray, description:chararray, url:chararray, urlToImage:chararray, publishedAt:chararray, content:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE data INTO 'hbase://data' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('datainfo:author, datainfo:title, datainfo:description, datainfo:url, datainfo:urlToImage, datainfo:publishedAt, datainfo:content');
