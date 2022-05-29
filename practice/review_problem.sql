use std;
show tables;
create table university(uid int not null auto_increment,uname varchar(20),primary key (uid));
insert into university(uname)values("Amravati"),("Nagpur"),("Pune"),("Mumbai");
select * from university;
create table college(cid int ,cname varchar(50));
insert into college(cid,cname)values(1,"HVPM"),(2,"RAYSONI"),(3,"SIPNA"),(5,"POTE");
select * from college;

select * from university 
inner join college on uid = cid;   
 
select * from university
 left join college on uid = cid;  
 
select * from university
 right join college on uid = cid;  
 
select * from university 
right join college on uid = cid
union 
select * from university 
left join college on uid = cid;


