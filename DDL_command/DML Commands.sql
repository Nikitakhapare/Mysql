use friend;
#create
#insert
#update
#delete
create table student(stdId int not null auto_increment,
					stdname varchar(20),
                    stdMarks int,
                    stdSection varchar(5),
                    primary key (stdID)
					);
drop table student;
#Insert 
insert into student(stdname, stdMarks, stdSection)
					values("Nikita", 85 ,"A"),
						   ("Priyaka",90,"A"),
                           ("Pari",95,"B");

#seelct

select * from student;
select stdId , stdname, stdMarks from student;

#Update

update student set stdMarks=93 where stdname='Nikita';

#delete 

delete from student
where stdname='Priyaka'; 
                    