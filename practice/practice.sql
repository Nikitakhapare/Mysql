use friend;
show tables;
select * from employee;
select stdname as Std_Name,stdMarks as Mark from student;
select stdname "Std_Name",stdMarks "Mark" from student;

create table emp(id int not null auto_increment primary key, fname varchar(20), lname varchar(20), age int,department varchar(10),phone_no int,hirring_date date);
insert into emp(fname,lname,age,department,phone_no,hirring_date) values ('piku','khapare',25,'EXTC',256245662,now()),('niya','chavhan',19,'EXTC',45985632,curdate()),
('riya','chavhan',27,'cse',90125484,'2021-03-15'),('shree','chint',24,'cse',45698723,'2019-04-13'),('pari','bhonde',18,'CIVIL',1236548,now()),
('Rahul','thakare',27,'MBA',1236589,now());


select * from emp;
select count(*) from emp;

alter table emp 
add sallary int;
update emp set sallary=40000 where id=19;
update emp set sallary=45000 where id=24;
update emp set fname='nik23' where id=20;
select distinct department from emp;
select department from emp group by department;
select * from emp order by fname desc;

select fname,lname,sallary,sallary*.15pf from emp ;
select id,fname,lname,sallary from emp order by sallary;
select sum(sallary) from emp;
select max(sallary),min(sallary) from emp;
select upper(fname) from emp;
select left(fname,3) from emp;
select 175*164+4896;
select concat(fname,' ',lname) from emp;
select trim(fname) from emp;
SELECT * FROM emp WHERE  fname REGEXP  '[0-9]';
select * from emp  limit 3;
select * from emp limit 3 offset 2;
select fname,lname,round(sallary/12,2) as monthly_sallary from emp;
select * from emp;

select fname,lname,sallary from emp where sallary not in(25000,35000);
select fname from emp where fname Like '%p%' and fname like '%i%';

select lname from emp where length(lname)=6;
select lname from emp where lname like '__o%';
