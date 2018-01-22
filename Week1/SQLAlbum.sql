#create table from .csv file
CREATE TABLE albumlist 
(Number int, Year int, Album text, 
Artist text, Genre text, Subgenre text);

COPY albumlist FROM '../albumlist.csv' csv header;


#find the count of albums in Rock genre at a certain time period
select count(*) from albumlist where genre like '%Rock%' and Year<1960

#find all genres
select count (distinct genre) from albumlist

#find the count of albums in a certain genre over years
select Year, count(*) from albumlist where genre like '%Rock%' group by Year order by year

#create corresponding table 
create table funkcount as (select Year, count(*) from albumlist where genre like '%Funk%' group by Year order by year)

#fint the artists and their albums, create table
create table artist as(select Artist, count(*) from albumlist group by Artist order by count desc)

#write the table in a .csv file
COPY funkcount TO '/Users/hanxu/Downloads/rockcount.csv' DELIMITER ',' CSV HEADER;
