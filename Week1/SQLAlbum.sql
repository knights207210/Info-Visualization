CREATE TABLE albumlist 
(Number int, Year int, Album text, 
Artist text, Genre text, Subgenre text);


COPY albumlist FROM '/Users/hanxu/Downloads/albumlist.csv' csv header;


select count(*) from albumlist where genre like '%Rock%' and Year<1960

select count (distinct genre) from albumlist

select Year, count(*) from albumlist where genre like '%Rock%' group by Year order by year

COPY rockcount TO '/Users/hanxu/Downloads/rockcount.csv' DELIMITER ',' CSV HEADER;

create table funkcount as (select Year, count(*) from albumlist where genre like '%Funk%' group by Year order by year)

create table artist as(select Artist, count(*) from albumlist group by Artist order by count desc)