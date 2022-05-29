create database Mydatabase;
use Mydatabase;

create table teacher(teacher_id int not null,fname varchar(20),class_no int,salary int,primary key (class_no)); 
insert into teacher(teacher_id,fname,class_no,salary) values(1,'swati',4,20000),(2,'priya',8,30000),(3,'Ram',7,30000);
drop table teacher;

drop table student;
create table student(stu_id int not null primary key, fname varchar(20),age int,class_no int, foreign key(class_no) REFERENCES  teacher(class_no));
insert into student(stu_id,fname,age,class_no) values(1,'niki',1,8),(2,'siya',9,8),(3,'pari',9,4),(4,'ram',6,7);

insert into student values(5,'ved',11,7);

#inner Join
select teacher.fname,teacher.class_no,student.fname from teacher
inner join student
where teacher.class_no=student.class_no;

#left join
select teacher.fname,teacher.class_no,student.fname from teacher
Left join student
on teacher.class_no=student.class_no;

select teacher.fname,teacher.class_no,student.fname from teacher
Right join student
on teacher.class_no=student.class_no;

select teacher.fname,teacher.class_no,student.fname from teacher
Left join student
on teacher.class_no=student.class_no
UNION
select teacher.fname,teacher.class_no,student.fname from teacher
Right join student
on teacher.class_no=student.class_no;

#equi join
select * from teacher,student
where teacher.class_no=student.class_no;

