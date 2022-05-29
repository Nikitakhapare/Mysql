use std;
show tables;
select * from student;
select * from designation;
drop table Mytable;
select * from employee;
select * from clothes;
drop table employee;
drop table clothes;
select * from mytable;

CREATE TABLE clothes (product_ID int PRIMARY KEY AUTO_INCREMENT,name varchar(255) NOT NULL,fabric text NOT NULL,size enum ('small', 'medium', 'large') NOT NULL);
select * from clothes;


use friend;
desc cusorder;
select * from cusorder;