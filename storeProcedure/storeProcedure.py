import mysql.connector
import json


with open ("F:\CFP\mysqlpython\sqlfuc.json","r") as file:
    data=json.load(file)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                            )

curobj=con.cursor()

class StoreProcedure:

    def create_procedure(self):
        que="""CREATE PROCEDURE get_emp_sallary() 
                BEGIN 
                     SELECT * FROM employee WHERE sallary > 20000; 
                     SELECT COUNT(id) AS total_emp FROM employee; 
                END;
            """
        curobj.execute(que)
        myresult=curobj.fetchall()
        for x in myresult:
            print(x)
        self.menu()

    def in_parameter(self):
        que="""CREATE PROCEDURE get_employee(IN var1 int,In var2 int)  
                BEGIN  
                    SELECT * FROM employee  limit var1 offset var2;  
                END
             """   
        curobj.execute(que)
        myresult=curobj.fetchall()
        for x in myresult:
            print(x)
        self.menu()

    def out_parameter(self):
        query="""CREATE PROCEDURE display_max_sallary (OUT HighestSallary INT)  
                 BEGIN  
                     SELECT MAX(sallary) INTO HighestSallary FROM employee;   
                 END 
              """
        curobj.execute(query)
        myresult=curobj.fetchall()
        for x in myresult:
            print(x)
        print("Function got Executed")
        self.menu()

    def inout_parameter(self):
        
        query="""CREATE PROCEDURE display_sallary (INOUT var1 INT)  
                 BEGIN  
                    SELECT sallary INTO var1 FROM employee WHERE id = var1;   
                 END  
        
              """
        curobj.execute(query)
        myresult=curobj.fetchall()
        for x in myresult:
            print(x)
        
        self.menu()

    def show_procedure(self):
        
        query="show procedure status where db='niki'"
        curobj.execute(query)
        myresult=curobj.fetchall()
        for x in myresult:
            print(x)
        
        self.menu()

    def drop_procedure(self):
       
        query="DROP PROCEDURE get_employee"
        curobj.execute(query)
        myresult=curobj.fetchall()
        for x in myresult:
            print(x)
        self.menu()
    
    
    def menu(self):
        choice=int(input("""
                            Enter Following Choice:
                            1. Create stored Procedure
                            2. create  in parameter procedure
                            3. create  out parameter procedure
                            4. create inout parameter procedure
                            5: Show Procedures Inside database
                            6: Drop Procedure

                          """  ))

        if choice==1:
            obj.create_procedure()
        if choice==2:
            obj.in_parameter()
        if choice==3:
            obj.out_parameter()
        if choice==4:
            obj.inout_parameter()
        if choice==5:
            obj.show_procedure()
        if choice==6:
            obj.drop_procedure()


if __name__=="__main__":
    print("Welcome to Stored Procedures in Mysql")
    obj=StoreProcedure()
    obj.menu()