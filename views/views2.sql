show databases;
create database views;
use views;
create  table agents(AGENT_CODE varchar(20), AGENT_NAME varchar(20), WORKING_AREA varchar(20),COMMISSION float, PHONE_NO int,COUNTRY varchar(20));
insert into agents(AGENT_CODE, AGENT_NAME,WORKING_AREA,COMMISSION,PHONE_NO,COUNTRY)values("A007","Ramasundar","Bangalore" ,0.15,077-25814763,"India"),
            ("A003","Alex","London",0.13,075-12458969,"America"),( "A008" ,"Alford","New York" ,0.12,044-25874365,"NewYork"),
            ( "A004" ,"Ravi Kumar","Bangalore",0.15 ,077-45625874,"India"),(" A006","Santakumar","Chennai", 0.14 ,007-22388644 ,"India"),
             ("A002","Lucida","San Jose",0.12,044-52981425,"America"), ("A005","Anderson","Brisban",0.13,045-21447739,"Africa"),
              ( "A001","Subbarao","Bangalore",0.14 ,077-12346674,"India");

select * from agents;
create view agentview as select * from agents;
select * from agentview; 
create view agentview1 as select * from agents where WORKING_AREA = "Bangalore";      # create view with where clause
select * from agentview1;
create view agentview2 as select AGENT_NAME,COMMISSION,COUNTRY from agents where WORKING_AREA = "Bangalore";     #Create View with specific columns and WHERE
select * from agentview2;
create view agentview3 as select AGENT_NAME,COMMISSION,COUNTRY from agents where WORKING_AREA = "Bangalore" AND COMMISSION > 0.1;    #Create View with AND operator
select * from agentview3;
create View agentview4 as select *  from agents where agent_code in ('A002','A004','A001','A009');        #Create View with IN
select * from agentview4;
create View agentview5 as select *  from agents where agent_code between "A002" AND "A005";               #Create View with BETWEEN
insert into  agentview5(AGENT_CODE, AGENT_NAME,COMMISSION,COUNTRY)values("A006","siya",0.12,"India");
select * from agentview5 ;
create View agentview6 as select AGENT_NAME,COMMISSION,COUNTRY from agents where AGENT_NAME like 'a%' with check option ;          #Create View with LIKE
insert into agentview6 (AGENT_NAME,COMMISSION,COUNTRY) values("Aditya",0.18,"Afrika");
insert into agentview6 (AGENT_NAME,COMMISSION,COUNTRY) values("Sana",0.18,"Afrika");        #gives the check opition error 
select * from agentview6;
drop view agentview6;
create or replace view agentview5 as select AGENT_CODE,AGENT_NAME,COMMISSION,COUNTRY from agents where AGENT_NAME like 'a%' ; 
select * from agentview5;
create View agentview7 as select AGENT_NAME,COMMISSION,COUNTRY from agents order by  AGENT_NAME DESC;          #Create View with order by in descending order
alter view agentview7 as select  AGENT_CODE,AGENT_NAME,COMMISSION,COUNTRY from agents order by  AGENT_NAME DESC; 
select * from agentview7;
insert into agentview7(AGENT_NAME,COMMISSION,COUNTRY) values ("Priya Chavan",0.16,"Kuwait");
select * from agentview7;
drop view agentview7;
delete from agentview4 where agent_code = "A002";
select * from agentview4;
update agentview4 set commission = 0.20 where AGENT_CODE = "A004";
alter view agentview as select * from agents where AGENT_CODE = "A004";
show create view views.agentview;    
create table info( AGENT_CODE varchar(20),rating int);  
insert into info(AGENT_CODE,rating)values("A002", 4),("A003",3);
select * from info;
select * from agents natural join info ;       
drop table info;
rename table info1 to info;
rename table agents13 to agents12;
create view agents12 as select info.*,agents.agent_name,agents.commission from info join agents on info.AGENT_CODE = agents.AGENT_CODE;
select * from agents12;
insert into agents12(AGENT_CODE,rating,agent_name,commission)values("A010",5,"Komal",0.14);
delete from agents12 where rating = 3;
create view agents14 as select COMMISSION,count(*) from agents group by COMMISSION;
select * from agents14;
insert into agents14(COMMISSION)values(0.15);