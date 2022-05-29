use niki;
show tables;
select * from employee;

#simple view
create view v1 as select id,emp_name,department from employee where department='IT';
select * from v1;
drop view v1;

create view v3 as select id,emp_name,department from employee where sallary >=2500;
select * from v3;

select * from employee;

insert into v3(id,emp_name,department,sallary) values(17,'yash','IT',35000);
create or replace view v1 as select * from employee where department='HR';
insert into v1(id,emp_name,department) value(11,'RK','hr'); 
update v1  set sallary=25000 where id=5;
delete from employee where id=15;
insert into v1(id,emp_name,department) value(12,'DB','IT'); 

#with check option 
create view v2 as select id,emp_name,department from employee where department='HR'or department='IT' with check option;
insert into v2(id,emp_name,department) values(14,'tanu','BFARM');
insert into v2(id,emp_name,department) values(14,'tanu','IT');

select * from v2;
drop view v2;


