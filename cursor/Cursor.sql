use niki;
show tables;
create table stu_table(id int not null auto_increment,stu_name varchar(20),stu_class int,primary key(id));
drop table stu_table;
insert into stu_table(stu_name,stu_class) values('niki',10),('siya',8),('pari',7),('rahul',12),('tanu',10);

select * from stu_table;

create table vbackupdata(id int ,Fname varchar(20));
drop table vbackupdata;


delimiter //
create procedure proc_stu()
	BEGIN
	DECLARE cur_id int;
	DECLARE cur_name varchar(20);
	DECLARE v_finished int default 0;
	DECLARE stu_cur cursor for select id,stu_name from stu_table;
	open stu_cur;
	get_stu:Loop
		fetch stu_cur into cur_id,cur_name;
		#select cur_id,cur_name;
		if v_finished=1 then
			leave get_stu;
		end if;
		insert into vbackupdata(id,fname) values(cur_id,cur_name);
	end LOOP get_stu;
	close stu_cur;
END //
delimiter ;
call proc_stu();

drop procedure proc_stu;

select * from vbackupdata;
truncate vbackupdata;






		

    
    