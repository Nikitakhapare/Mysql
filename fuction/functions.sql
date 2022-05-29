create database niki;
use niki;
create table employee(id int not null auto_increment,
						emp_name varchar(20),
                        department varchar(20),
                        sallary int,
                        primary key (id)
                        );
insert into employee(emp_name,department,sallary) 
values('niki','HR',11200),('ram','IT',25000),
('siya','MRKT',45000),('pari','IT',25000),('priyanka','HR',20000);                      
insert into employee(emp_name,department,sallary) values('yogita','CR',null);

#Aggregate fuctions 
select * from employee;
select max(sallary) from employee;

select min(sallary) from employee;
select min(sallary) from employee where sallary>15000;

select count(*) from employee;
select count(sallary) from employee;
select count(id) from employee where sallary > 20000;

select count(distinct(sallary)) from employee;   #it gives unique count only
select sum(sallary) from employee;
select sum(distinct(sallary)) from employee;
select avg(sallary) from employee;
select avg(distinct(sallary)) from employee;

#numeric fuction 
select abs(-5);
select acos(0.5);

select ceil(sallary >= 30000) from employee;


select max(sallary) from employee;
select greatest(12,35,68,89,69,32); 
select least(12,35,68,89,69,32);
select mod(13,3);
select pow(5,3);
select power(4,2);
select 12 div 3;
SELECT sallary DIV 2 FROM employee;
select rand(),rand(3);
select sqrt(36);
SELECT SIGN(-50);    
SELECT SIGN(50);   

select workofyear(now());
select bin(76);
select system_user();

#string 

select id ,upper(emp_name) from employee;
select id , lower(emp_name) from employee;
select char_length(emp_name) FROM employee;
SELECT TRIM("      Welcome       ");
SELECT LTRIM("       Oracal");
SELECT LEFT(emp_name,3) FROM employee;
SELECT RIGHT(emp_name ,4) FROM employee;
SELECT MID(emp_name,2,4) FROM employee;
SELECT REVERSE(emp_name) FROM employee;
SELECT REPLACE(emp_name ,"i","I") FROM employee;
SELECT REPEAT(emp_name,2) FROM employee;

#date time fuction
SELECT NOW();                       
SELECT current_date();               
SELECT current_time();               ;
SELECT DATE(NOW());                                   
SELECT DAY(NOW());                   
SELECT MONTH(NOW());              
SELECT YEAR(NOW());                
SELECT TIME(NOW());                  
SELECT HOUR(CURRENT_TIME());       x
SELECT MINUTE(CURRENT_TIME());        
SELECT SECOND(CURRENT_TIME());        
SELECT WEEK(NOW());
SELECT WEEKOFYEAR(NOW());
SELECT WEEKDAY(NOW());
SELECT SYSDATE();
SELECT DAYNAME(NOW());

