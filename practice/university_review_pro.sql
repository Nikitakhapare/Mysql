create database mydb;
use mydb;
drop table university;
create table university(un_id int primary key,un_name varchar(20));
insert into university(un_id,un_name) values(10,'mumbai'),(20,'nagpur');

select * from university;

create table college(col_id int not null primary key ,clg_name varchar(20),un_id int, foreign key(un_id) references university(un_id));
insert into college(col_id,clg_name,un_id) values(2,'VJIT',10),(4,'NMIMS',10),(6,'RAYSONI',20),(8,'YCC',20);

select * from college;

select university.un_name, college.* from university,college where university.un_id=college.un_id;

create table department(dep_id int not null primary key,dep_name varchar(20),col_id int, 
foreign key (col_id) references college(col_id),un_id int);

insert into department(dep_id,dep_name,col_id,un_id) values(123,'CT',2,10),(124,'IT',2,10),(108,'CT',4,10),(109,'IT',4,10),(12,'CTech',6,20),(13,'IT',6,20),
(40,'CTech',8,20),(41,'IT',8,20);

select * from department;

select university.un_name,college.clg_name,department.dep_name from university inner join college on university.un_id=college.un_id inner join department 
on college.col_id=department.col_id where university.un_id=10;


select * from department;
select * from college;

create table teacher(id int not null auto_increment primary key, fname varchar(20),address varchar (30),dep_id int,
					foreign key (dep_id) references department(dep_id),col_id int,foreign key (col_id) references college(col_id));
                    
insert into teacher(fname,address,dep_id,col_id) values('niki','amravati',12,6),('siya','amravati',12,6),
('ram','warud',13,6),('pari','amravati',13,6),('piya','nagpur',40,8),('hitesh','Nagur',40,8),('Pranay','Amravati',41,8),('riya','nagpur',41,8),
('Mohini','Mumbai',108,4),('Kiran','Dombivali',108,4),('Ashvini','pune',109,4),('Sudhakar','Pimpri',109,4),
('Ranjana','Nagpur',123,2),('Rahul','Morshi',123,2),('Rushi','chandur',124,2),('nikita','chandur',124,2);

select * from teacher;
drop table student;
create table student(stu_id int not null auto_increment primary key,fname varchar(20),address varchar(20),
						dep_id int, foreign key (dep_id) references department(dep_id));
                        
insert into student(fname,address,dep_id) values('sai','chandur',12),('tarun','Morshi',12),('Shivam','pimpri',13),('Aayush','pimpri',13),
('siyu','chandur',108),('piyu','chandur',108),('tinu','warud',109),('minu','warud',109);
select * from student;

create table 7thsemister(sub1 int,sub2 int, sub3 int,stu_id int, foreign key (stu_id)references student(stu_id));
insert into 7thsemister(sub1,sub2,sub3,stu_id) values(45,87,86,1),(35,44,50,2),(36,54,53,3),(71,46,95,4),
(63,56,49,5),(46,75,84,6),(84,57,65,7),(61,39,78,8);

select * from 7thsemister;

create table 8thsemister(stu_name varchar(20),sub1 int,sub2 int, sub3 int,stu_id int, foreign key (stu_id)references student(stu_id));
insert into 8thsemister(sub1,sub2,sub3,stu_id) values(53,46,49,1),(46,45,84,2),(54,57,65,3),(61,39,58,4),
(45,67,66,5),(35,44,50,6),(36,54,53,7),(71,46,95,8);


select * from college;
select * from department;

#Ctech department topper of 7th and 8th semister of raysoni college of nagpur university
select 7thsemister.stu_id, student.fname, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id and student.dep_id=12;

#IT department topper of 7th and 8th semister of raysoni college of nagpur university
select 7thsemister.stu_id, student.fname, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id and student.dep_id=13;

#CTect department topper of 7th and 8th semister of NMIMS college of Mumbai university
select 7thsemister.stu_id, student.fname, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id and student.dep_id=108;

#IT department topper of 7th and 8th semister of NMIMS college of Mumbai university
select 7thsemister.stu_id, student.fname, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id and student.dep_id=109;

select * from department;
select * from college;

select * from teacher;
select * from student;

#MUMbai university topper
select 7thsemister.stu_id, student.fname,college.clg_name, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id inner join department
on student.dep_id=department.dep_id inner join college on college.un_id=department.un_id and college.un_id=20;

#Nagpur university topper
select 7thsemister.stu_id, student.fname,college.clg_name, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id inner join department
on student.dep_id=department.dep_id inner join college on college.un_id=department.un_id and college.un_id=20;


#college topper of Raysoni college
select 7thsemister.stu_id, student.fname,college.clg_name,max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id inner join department
on student.dep_id=department.dep_id inner join college on college.col_id=department.col_id and college.col_id=6;

#college topper of NMIMS college
select 7thsemister.stu_id, student.fname,college.clg_name, max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id inner join department
on student.dep_id=department.dep_id inner join college on college.col_id=department.col_id and college.col_id=4;

select * from teacher;

##teacher name of  same address of topper of raysoni college
select 7thsemister.stu_id, student.fname,teacher.fname,teacher.address,student.address, college.clg_name,max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id 
inner join department on student.dep_id=department.dep_id inner join college on college.col_id=department.col_id and college.col_id=6 
inner join teacher on college.col_id=teacher.col_id and teacher.address=student.address;

update teacher set address='chandur' where id=4; 


##teacher name of  same address of topper of NMIMS college
select 7thsemister.stu_id, student.fname,teacher.fname,teacher.address,student.address, college.clg_name,max(7thsemister.sub1+7thsemister.sub2+7thsemister.sub3  + 8thsemister.sub1+8thsemister.sub2+8thsemister.sub3) as total_marks2
from 7thsemister inner join 8thsemister on 7thsemister.stu_id=8thsemister.stu_id inner join student on 8thsemister.stu_id=student.stu_id 
inner join department on student.dep_id=department.dep_id inner join college on college.col_id=department.col_id and college.col_id=4 
inner join teacher on college.col_id=teacher.col_id and teacher.address=student.address;


select * from student;
select * from teacher;
select * from university;
select * from department;
select * from college;
select * from 7thsemister;







select * from college;

-- create table semister(sem int not null,fname varchar(20),sub1 int , sub2 int , sub3 int, stu_id int, foreign key (stu_id) references student(stu_id));
-- insert into semister(sem,fname,sub1,sub2,sub3,stu_id) values (7,'sai',53,46,49,1),(7,'tarun',46,45,84,2),(7,'shivam',54,57,65,3),(7,'Aayush',61,39,58,4),
-- (8,'sai',45,67,66,1),(8,'tarun',35,44,50,2),(8,'Shivam',36,54,53,3),(8,'Aayush',71,46,95,4);

-- select * from semister;
-- drop table semister;

-- select semister.stu_id,student.fname,min(sub1+sub2+sub3) as totalmarks from semister,student where sem between 7 and 8 and student.dep_id=12;
-- select semister.stu_id,student.fname,(sub1+sub2+sub3) as totalmarks from semister,student where sem=7 and sem=8 and student.dep_id=12 ;


#-- CTech department in  NMIMS college of mumbai university
-- SELECT 8thsemister.stu_id,student.fname, max(sub1 + sub2 + sub3) AS totalmarks FROM 7thsemister,student WHERE sub1 >= 40 AND sub2 >= 40 AND sub3 >= 40 AND student.dep_id=108 ;

-- #IT department in  NMIMS college of mumbai university
-- SELECT 8thsemister.stu_id,student.fname, max(sub1 + sub2 + sub3) AS totalmarks FROM 7thsemister,student WHERE sub1 >= 40 AND sub2 >= 40 AND sub3 >= 40 AND student.dep_id=109  ;

-- #CTech department in  Raysoni college of nagpur university
-- SELECT 7thsemister.stu_id,student.fname, min(sub1 + sub2 + sub3) AS totalmarks FROM 7thsemister,student WHERE sub1 >= 40 AND sub2 >= 40 AND sub3 >= 40 AND student.dep_id=12 ;
-- #IT department topper in Raysoni college of nagpur university
-- SELECT 7thsemister.stu_id,student.fname, max(sub1 + sub2 + sub3) AS totalmarks FROM 7thsemister,student WHERE sub1 >= 40 AND sub2 >= 40 AND sub3 >= 40 AND student.dep_id=13;  ;