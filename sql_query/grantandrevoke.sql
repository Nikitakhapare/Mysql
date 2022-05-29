##steps of grant and revoke

select host,user from mysql.user;
show databases;
use student;
show tables;
show grants for niki@localhost;
revoke update on studentinfo from niki@localhost;
select * from studentinfo;
update studentinfo set fname='siya' where stuid=4;
#to check first login from niki user open student database try to update 
#that table it show you to permission denied then if you want to give agin
# permision login to root user run following command.
grant all on studentinfo to niki@localhost;

