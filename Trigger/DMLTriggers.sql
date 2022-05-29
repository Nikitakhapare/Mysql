use student;
show tables;
create table mytable(id int not null auto_increment,fname varchar(20),age int, primary key(id));
desc mytable;
show triggers from student;

#DML TRiggers

create trigger mytable_bins
before insert
on mytable
for each row
set new.fname=upper(new.fname);

drop trigger mytable_bins;
insert into mytable(fname,age) values('niki',25),('ram',2),('pari',7);
select * from mytable;

delimiter //
create trigger mytable_bupd
before update
on mytable
for each row
BEGIN
    if new.age < 18 then set new.age=18;
    end if;
 End //
delimiter ;
 
drop trigger mytable_bupd;

insert into mytable(fname,age) values('priyanka',26),('siya',2);
select * from mytable;

insert into mytable(id,fname,age) values(4,'siya',5);
update mytable set age=10 where id=4;

create table employee(emp_id int not null,emp_name varchar(20),emp_age int,primary key (emp_id));

delimiter //
create trigger mytable_bdlt
before delete
on mytable
for each row
BEGIN 
	insert into employee(emp_id,emp_name,emp_age) 
    values (old.id,old.fname,old.age);
END 
 //
 delimiter ;
 
 delete from mytable where id=2;
 select * from employee;

#after insert 
create table mytable2(id int not null primary key, first_name varchar(20), age int);

delimiter //
create trigger mytable_after_insert
after insert
ON mytable for each row
BEGIN 
	insert into mytable2(id,first_name,age)
    values(new.id,new.fname,new.age);
END//
delimiter ;

drop trigger mytable_after_insert;
insert into mytable values(5,'ved',7);
select * from mytable2;

#after Update
create table status(user_name varchar(20),status text);

create trigger mytable_after_update
after update
on mytable
for each row
insert into status values(current_user(),concat('update by',' ',old.fname,' ',now()));

drop trigger mytable_after_update;
 
 update mytable set age=20 where id=3;
 select * from status;
 
 #after delet
 
 create table backup(user varchar(20),comment varchar(100));
 
 create trigger mytable_After_delet
 After delete
 on mytable for each row
 insert into backup values(current_user(),concat('Delete record fro user',' ',old.fname,' ',now()));

drop trigger mytable_After_delet;

insert into mytable values(6,'riya',18); 
select * from mytable;

delete from mytable where id=6;
select * from backup; 



