use niki;
show tables;
select * from employee;
DELIMITER &&  
CREATE PROCEDURE get_emp_sallary()  
BEGIN  
    SELECT * FROM employee WHERE sallary > 20000;  
    SELECT COUNT(id) AS total_emp FROM employee;    
END &&  
DELIMITER ;  

call get_emp_sallary;

DELIMITER &&  
CREATE PROCEDURE get_employee(IN var1 int,In var2 int)  
BEGIN  
    SELECT * FROM employee  limit var1 offset var2;  
END &&  
DELIMITER ;  

call get_employee(4,2);
drop procedure get_employee;

DELIMITER &&  
CREATE PROCEDURE display_max_sallary (OUT HighestSallary INT)  
BEGIN  
    SELECT MAX(sallary) INTO HighestSallary FROM employee;   
END &&  
DELIMITER ;  

call display_max_sallary(@sal);
select @sal;

DELIMITER &&  
CREATE PROCEDURE display_sallary (INOUT var1 INT)  
BEGIN  
    SELECT sallary INTO var1 FROM employee WHERE id = var1;   
END &&  
DELIMITER ;  

set @sal='2';
call display_sallary(@sal);
select @sal;

show procedure status where db='niki';
drop procedure display_max_sallary;



