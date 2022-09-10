#checking version of the server
SELECT VERSION();

#checking the date and time
SELECT NOW();


# simple query that asks the server to 
#tell you its version number and the current date.
SELECT VERSION(), CURRENT_DATE;


#selecting the current user and the date
SELECT user() , current_date();


#Use the SHOW statement to find out what databases
# currently exist on the server:
SHOW DATABASES;

#used to select the data base you want to work
USE sys;
use tutorial;

 #show all the list of tables inside the database
SHOW TABLES;

#creating a database using create

CREATE DATABASE demo;

USE demo;


#createing sample table 
CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);


#show the table in the demo database
SHOW TABLES;


#describes / checking the structure of the table 

DESCRIBE pet;


use world;

show tables;

describe city;

#inserting the data into the table 

INSERT INTO pet
       VALUES ('Puffball','Diane','dog','f','1999-03-30',NULL);
INSERT INTO pet
       VALUES ('Fluffy','Harold','cat','f','1993-02-04',NULL);
INSERT INTO pet
       VALUES ('Claws','Gwen','cat','m','1994-03-17',NULL);
INSERT INTO pet
       VALUES ('Buffy','Harold','dog','f','1989-05-13',NULL);
INSERT INTO pet
       VALUES ('Fang','Benny','dog','m','1999-03-30',NULL);
INSERT INTO pet
       VALUES ('Bowser','Diane','dog','m','1979-08-31','1995-07-29');
INSERT INTO pet
       VALUES ('Gwen','Gwen','bird','f','1998-09-11',NULL);
INSERT INTO pet
       VALUES ('Gwen','Diane','bird',null,'1997-12-09',NULL);
INSERT INTO pet
       VALUES ('Benny','Diane','dog','m','1996-04-29',NULL);



#selecting all the pet
select * from pet;

#selecting based on the name
select * from pet where name = 'Bowser';
select * from pet where species = 'cat';
#select * from pet where death = null;

#selecting the pet using birth with <=
select * from pet where birth <= '1998-1-1';

#selecting the pet using birth with >=
select * from pet where birth >= '1998-1-1';

#selecting the dogs based on gender
select * from pet where species = 'dog' and sex = 'f';


#selecting the species of type snake or bird
select * from pet where species = 'snake' or species = 'bird';


select * from pet where species = 'dog' or species = 'bird';




#slecting the species dog and cat , dog gender is f and cat is m
select * from pet where (species = 'cat' and sex = 'm')
 or (species = 'dog' and sex = 'f');
 
 
 #selcting specific columns
 select name, birth from pet;
 
 
 select owner from pet;
 
 #selecting unique data of owner
 select Distinct owner from pet;
 
 #selecting species dog and cat columns are name, species birth
 select name , species, birth from pet 
 where species = 'dog' or species = 'cat';
 
 #sorting the birth column
  SELECT name, birth FROM pet ORDER BY birth ASC;


 SELECT name, birth FROM pet ORDER BY birth DESC;
 
 
 SELECT name, species, birth FROM pet
       ORDER BY species, birth DESC;
       
       
       
 SELECT name, birth, CURDATE(),
       TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age
       FROM pet;
       
 #calculating the age using Timestampdiff()  and sortig the name      
SELECT name, birth, CURDATE(),
       TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age
       FROM pet ORDER BY name;

#calculating the age using Timestampdiff() 
SELECT name, birth, CURDATE(),
       TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age
       FROM pet ORDER BY age;
       
       
 #selecting the data which is having death date      
SELECT name, birth, death,
       TIMESTAMPDIFF(YEAR,birth,death) AS age
       FROM pet WHERE death IS NOT NULL ORDER BY age;
       
select * from pet where death is null;
       
 #using month function for getting the month from birth column      
 SELECT name, birth, MONTH(birth) FROM pet;
 
 
  SELECT name, birth FROM pet WHERE MONTH(birth) = 5;
  
  
#To find names beginning with b:  
SELECT * FROM pet WHERE name LIKE 'b%';
  
  #To find names ending with fy:
SELECT * FROM pet WHERE name LIKE '%fy';
  
  #To find names containing a w:
SELECT * FROM pet WHERE name LIKE '%w%';
  
  #To find names containing exactly five characters, use five instances of the _ pattern character:
SELECT * FROM pet WHERE name LIKE '_____';
   
   
   #To find names beginning with b, use ^ to match the beginning of the name:
SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b');
   
   #To find names ending with fy, use $ to match the end of the name:
SELECT * FROM pet WHERE REGEXP_LIKE(name, 'fy$');
   
   #To find names containing a w, use this query:
SELECT * FROM pet WHERE REGEXP_LIKE(name, 'w');
    
    #To find names containing exactly five characters,
    #use ^ and $ to match the beginning 
    #and end of the name, and five instances of . in between
SELECT * FROM pet WHERE REGEXP_LIKE(name, '^.....$');
    
    #You could also write the previous query using the {n} (“repeat-n-times”) operator
SELECT * FROM pet WHERE REGEXP_LIKE(name, '^.{5}$');
    
 #counting the items in the table    
SELECT COUNT(*) FROM pet;
    
#Counting the items  and grouping by owners
SELECT owner, COUNT(*) as owner_count FROM pet GROUP BY owner;
     
 #Counting the items  and grouping by species    
SELECT species, COUNT(*) FROM pet GROUP BY species;
 
 
#gender is getting counted and grouped
SELECT sex, COUNT(*) FROM pet GROUP BY sex;
      
      
SELECT species, sex, COUNT(*) FROM pet GROUP BY species, sex;

SELECT species, sex, COUNT(*) FROM pet GROUP BY species, sex;
      
      
SELECT species, sex, COUNT(*) FROM pet
       WHERE species = 'dog' OR species = 'cat'
       GROUP BY species, sex;
      
      
SELECT species, sex, COUNT(*) FROM pet
       WHERE sex IS NOT NULL
       GROUP BY species, sex;