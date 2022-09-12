use demo;


#adding a  new column into the existing table
alter table movie_table add column date_of_purchase date;

#it will delete the records and table structure
drop table movie_table;

#this is used to rename the table name
rename table movie_table to movie_data;

#it will delete only the records 
truncate table movie_data;

rename table movie_data to movie_table;

#---------------------------------------------
#it select all the columns from the table
select * from movie_table;
select * from my_contacts;



#Querying Single Table
#select specific columns in the table
select title from movie_table;


#Fetch movies is sorted Ascending order
select movie_id,title from movie_table order by title asc; 


#fetch movies in sorted Desending order 
select movie_id,title from movie_table order by title desc;


#Aliases
select title,movie_id from movie_table;

SELECT DISTINCT title FROM movie_table;

#select 
select title from movie_table where title != 'Big Advenure' and title != 'Take it Back';


#AND
#0 0 0
#0 1 0
#1 0 0
#1 1 1

#OR
#0 0 0
#0 1 1
#1 0 1
#1 1 1

#Fetching the title from movie_table using like opertor
select title from movie_table where title like 'Take it Back';

#used to select the rows which are not null
select * from my_contacts where interests is not  null;

