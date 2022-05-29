use student;
show tables;
create table college(depid int not null auto_increment,
                    depName varchar(30) ,
					dep_floar int unique not null,
                    no_of_staf int default 10,
					age int,
                    constraint age check(age >= 30),
                    primary key (depid)
                    );
desc  college;
drop table college;	
 insert into college(depname,dep_floar,age)
 values('cse',3,40),('extc',2,50);
 select * from college;
 
 #drop default constraint 
ALTER TABLE college
alter no_of_staf drop default;

#drop unique constraint
alter table college
drop constraint dep_floar;

#drop check constraint
Alter table college 
drop check age;

