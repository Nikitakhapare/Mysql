create database bipp;
use bipp;
create table student(Stu_ID int not null primary key auto_increment, Stu_Name varchar(30), Address varchar(20), Parentemail varchar(40));

insert into student(stu_name,address,Parentemail) values('niki','amravati','rupraojikhapare@gmail.com'),('siya','Pune','priyankachavhan@gmail.com'),
('ram','warud','rohankhapare@gmail.com'),('pari','nagpur','kiranbhonde@gmail.com');

create table grades( Subject varchar(20),Grade char(2),TestDate date,Stu_ID int, Foreign key (stu_id) references student(stu_id));
insert into grades(subject,grade,testDate,stu_id) values('math','A','2021-12-15',1),('science','B','2021-12-15',1),('English','A','2021-12-15',1),
('math','A','2021-12-15',2),('science','D','2020-12-15',2),('English','A','2022-02-15',2),
('math','c','2021-12-15',3),('science','B','2022-03-15',3),('English','D','2022-03-15',3),
('math','D','2022-04-15',4),('science','B','2021-12-15',4),('English','A','2021-12-15',4);


select stu_name,parentemail from student inner join grades on student.stu_id=grades.stu_id and grade ='D' and testdate>=curdate()-interval 6 month;

select student.stu_name,student.parentemail from student,grades where student.stu_id=grades.stu_id and grades.grade='D' 
and grades.testdate >=curdate()-interval 6 month;
