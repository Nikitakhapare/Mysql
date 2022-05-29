use niki;
show tables;
select * from employee;

select name,department from student where age>=25;
select department,age from student group by department having age>=22;

#Order_By
select * from employee order by id desc;
select * from employee order by emp_name asc,id desc; 
select * from employee order by sallary;

#where
select emp_name,sallary from employee where id=3;
select * from employee where sallary > 2000 and sallary<40000;
update employee set sallary=25000 where id=4;

#Group By
select department,count(*) from employee where sallary >=20000 group by department; 
select department from employee group by department;
select department,max(sallary)from employee group by department;
select department, avg(sallary) from employee group by department;
select department, sum(sallary),avg(sallary) from employee group by department;
select sallary from employee group by sallary;

#Having clause

select department,count(*) from employee  group by department having count(*)>=2; 
select * from employee;
select department,count(*) from employee group by department having count(*)>=2 order by count(*) desc;

show tables;
select * from person;

#Union 
select address from person 
union
select emp_name from employee;

# Limit
select * from employee Limit 3;
select * from employee Limit 3 offset 2;





