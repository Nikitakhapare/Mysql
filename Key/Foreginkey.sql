use student;
show tables;
drop table person;
create table person(per_id int not null auto_increment,
					fname varchar(20), 
                    lname varchar(30),
                    pho_no int unique,
                    primary key(per_id)
					);
insert into person(fname,lname,pho_no) values('niki','khapare',1234256),('pari','bhonde',42538689);
# create table using foregine key constraint 
create table orders(ord_id int not null, 
					ord_no int not null,
                    per_id int,
					primary key (ord_id),
                    constraint fk_perord
                    foreign key (per_id) REFERENCES person(per_id));

insert into orders(ord_id,ord_no,per_id) values(1,12,1),(2,35,2);
insert into orders(ord_id,ord_no,per_id) values(3,12,2);
update orders set ord_no=15 where ord_id=3;


select * from orders;
select * from person;
#drop foreign key constraints
alter table orders
drop foreign key fk_perord;
    

drop table orders;
                    

                    