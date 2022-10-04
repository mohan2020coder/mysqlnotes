create database joins;
use joins;


create table toy(toy_id int not null primary key, toy_name varchar(20) ,cat_id int);

create table cat(cat_id int not null, cat_name varchar(50), mom_id int, owner_id int,age int);


insert into toy(toy_id, toy_name,cat_id) values (1,'ball',3);
insert into toy(toy_id, toy_name,cat_id) values (2,'spring',null);
insert into toy(toy_id, toy_name,cat_id) values (3,'mouse',1);
insert into toy(toy_id, toy_name,cat_id) values (4,'mouse',4);
insert into toy(toy_id, toy_name,cat_id) values (5,'ball',1);

insert into cat(cat_id, cat_name,mom_id,owner_id,age) values(1,'Kitty',5,1,17);
insert into cat(cat_id, cat_name,mom_id,owner_id,age) values(2,'Hugo',1,2,10);
insert into cat(cat_id, cat_name,mom_id,owner_id,age) values(3,'Sam',2,2,5);
insert into cat(cat_id, cat_name,mom_id,owner_id,age) values(4,'Misty',1,NULL,11);

create table owner(id int, name varchar(25), age int);

insert into owner(id, name,age) values (1,'John smith',18);
insert into owner(id, name,age) values (2,'Danielle davis',10);

select * from toy join cat where toy.cat_id = cat.cat_id;


select * from toy, cat where toy.cat_id = cat.cat_id;

select * from toy natural join cat;

#left join
select * from toy left join cat on toy.cat_id = cat.cat_id;


#right join
select * from toy right join cat on toy.cat_id = cat.cat_id;


#full join
select * from toy full join cat;

#cross join
select * from toy cross join cat;

#or
select * from toy,cat;



select o.name as owner_name, c.cat_name from cat as c
 join owner as o on c.cat_id = o.id;
 
 
 SELECT
o.name AS owner_name,
c.cat_name
FROM cat AS c
JOIN owner AS o
ON c.owner_id = o.id;


SELECT
child.cat_name AS child_name,
mom.cat_name AS mom_name
FROM cat AS child
JOIN cat AS mom
ON child.mom_id = mom.cat_id;


SELECT
a.toy_name AS toy_a,
b.toy_name AS toy_b
FROM toy a
JOIN toy b
ON a.cat_id < b.cat_id;


SELECT
t.toy_name,
c.cat_name,
o.name AS owner_name
FROM toy t
JOIN cat c
ON t.cat_id = c.cat_id
JOIN owner o
ON c.owner_id = o.id;

SELECT
t.toy_name,
c.cat_name,
o.name AS owner_name
FROM toy t
JOIN cat c
ON t.cat_id = c.cat_id
LEFT JOIN owner o
ON c.owner_id = o.id;

SELECT
t.toy_name,
c.cat_name,
o.name AS owner_name
FROM toy t
LEFT JOIN cat c
ON t.cat_id = c.cat_id
LEFT JOIN owner o
ON c.owner_id = o.id;

SELECT
cat_name,
o.name AS owner_name,
c.age AS cat_age,
o.age AS owner_age
FROM cat c
JOIN owner o
ON c.owner_id = o.id
AND c.age < o.age;
 
 
 