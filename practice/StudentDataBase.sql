create database student;
show databases;
use student;
select database();

#create

create table studentInfo(
stuId int not null auto_increment,
fname varchar(20),
lname varchar(20),
age int,
city varchar(20),
primary key (stuId)
);

describe studentInfo;

insert into studentInfo(fname,lname,age,city)
values('niki','khapare',25,'amravati'),
('pari','bhode',7,'nagpur'),('ved','deshmukh',2,'warud');

#Read
select * from studentInfo;

#UPdate
#alter and update

alter table studentInfo
modify fname varchar(30);

describe studentInfo;


update studentInfo set lname="khapare" WHERE fname="ved";

select * from studentInfo;

#delete 
#drop and delete

delete from studentinfo
where fname='ved';

select * from studentinfo;




















