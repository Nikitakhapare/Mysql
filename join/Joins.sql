use niki;
create table person(Id int not null, name varchar(30), address varchar(30), contact int unique, primary key (id)); 
insert into person(id,name,address,contact) 
values(10,'niki','amravati',901254783),(20,'siya','pune',456985422),(30,'pari','nagpur',966518571),(40,'rushi','chandur',967308051);
select * from person;
create table proffesion(work varchar(15), DEPT varchar(15),ID int,primary key (ID));
insert into proffesion(work,dept,id) 
values('teacher','CSE',20),('doctor','MBBS',40),('teacher','MBA',50),('programmer','java',60),('cashier','icici',10);
select * from proffesion;

#natural join
select person.id,name,contact,dept from person 
natural join proffesion;

select * from person 
natural join proffesion;

#equi join
select * from person,proffesion
where person.id=proffesion.id;

select name,address,work
from person,proffesion
where person.id=proffesion.id;

# inner Join
select * from person
inner join proffesion 
on person.id=proffesion.id;

# Left Join

#sql join -1) cross join
select * from person 
cross join proffesion;

select person.id, name, work,dept from person 
cross join proffesion;

#left outer join

select * from person
left join proffesion
on person.id=proffesion.id;

select person.id, name, work,dept from person 
left join proffesion
on person.id=proffesion.id;

#Right outer join
select * from person
right join proffesion
on person.id=proffesion.id;

#full outer join

select * from person
left join proffesion
on (person.id=proffesion.id)
union
select * from person
right join proffesion
on (person.id=proffesion.id);

select person.Id,person.name,proffesion.work,proffesion.dept from person 
full join proffesion
on (person.Id=proffesion.Id);

#self join
create table person1(Id int not null, name varchar(30), address varchar(30), contact int unique,age int, primary key (id)); 
insert into person1(id,name,address,contact,age) 
values(10,'niki','amravati',901254783,20),(20,'siya','pune',456985422,15),(30,'pari','nagpur',966518571,10),(40,'rushi','chandur',967308051,30);
select * from person1;

#self join
select p1.name,p1.address,p2.contact from person1 p1,person1 p2 where p1.id=p2.age;
