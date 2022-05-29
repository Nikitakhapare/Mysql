use niki;
show tables;

create table personforIndex(id int not null auto_increment ,fname varchar (20),lname varchar(20),age int,primary key(id));
insert into personforIndex(fname,lname,age) values('piku','khapare',25),('manu','khapare',22),('niya','chavhan',19),('riya','chavhan',27),
('shree','chint',24),('para','bhonde',18),('sai','tarun',30),('Rahul','thakare',27),('shiv','khapare',23),('ved','deshmukh',9),('rushi','wakode',26);
select count(*) from personforIndex;
select * from personforIndex;
select count(*) from personforIndex where length(lname)>=5;

create index idx_fname on personforIndex (fname);
drop index idx_fname on personforIndex;

select count(*) from personforIndex where fname='rushi';
drop index idx_fname on personforIndex;
drop index idx_fname on personforIndex;

update personforIndex set lname='chintanvar' where fname='yash';
select count(*) from personforIndex where age Between '20' and '25';

create index idx_lname_age on personforIndex (lname,age);
drop index idx_lname_age on personforIndex;

show index from person;

