use friend;
show tables;
desc cusorder;
alter table cusorderempinfocusorder
add (cuslname varchar(20),
   cusfullname varchar(30));
#create
#rename 
#alter
#truncate
#drop 


#create
create table employee(empId int not null auto_increment,
					  empFName varchar(20),
					  empLName varchar(20),
                      age int,
                      primary key (empId)
                      );


describe employee;

insert into employee(empfname,emplname,age) values('niki','khapare',25),
('ved','deshmukh',1),('siya','chavhan',2);

select * from employee;

#alter
alter table employee
add empSallary int;

alter table employee 
drop empSallary;

alter table employee
modify empFName varchar(30);

create table empOrder(ordId int not null auto_increment,
					cusName varchar(30),
                    shipDate date,
					primary key (ordId)
                    );

insert into emporder(cusName,shipDate)values('niki','2021-05-12');

insert into emporder(cusName,shipDate)values('siya',curdate());
insert into emporder(cusName,shipDate)values('pari',now());

select * from emporder;
#rename
alter table emporder rename to cusOrder;
#truncate
TRUNCATE table employee;
select * from employee;
#drop
drop table employee;
