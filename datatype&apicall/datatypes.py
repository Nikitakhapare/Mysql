import json
import mysql.connector

with open("F:\CFP\mysqlpython\conn.json","r")as file:
    data=json.load(file)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                           )

cur=con.cursor()

class DataType:
    

    def drop_table(self):
       
        query="DROP TABLE If EXITS employee,clothes,MyTable"
        cur.execute(query)
        self.menu()


    #date and time
    def create_table(self):
        query="create table employee(id int not null auto_increment,emp_name varchar(20),age int,emp_type char(5),date_of_join date, Time_of_joining Time,certifies year,primary key(id));"
        cur.execute(query)
        self.menu()

    def insValue(self):
        sql="Insert into employee(emp_name,age,emp_type,date_of_join,Time_of_joining,certifies) values(%s,%s,%s,%s,%s,%s)"
        val=[('niki',26,'full','2020-04-12','10:05:00','2021'),('pari',20,'part','2022-05-16','11:20:00','2022')]
        cur.executemany(sql,val)
        con.commit()

    def table2(self):
        
        que="CREATE TABLE clothes (product_ID int PRIMARY KEY AUTO_INCREMENT,name varchar(255) NOT NULL,fabric text NOT NULL,size enum ('small', 'medium', 'large') NOT NULL)"
        cur.execute(que)
        self.menu()

    def insIntostring(self):
        sql="INSERT INTO clothes(name, fabric, size) values(%s,%s,%s)"
        VALU= [('Jeanse', 'cotton', 'large'),('Top','silk','small'),('lagin','hojeri','medium')]
        cur.executemany(sql,VALU)
        con.commit()
        self.menu()

    def table3(self):
        tb2="CREATE TABLE MyTable(MyBigIntColumn BIGINT  ,MyIntColumn  INT,MySmallIntColumn SMALLINT,MyDecimalColumn DECIMAL(5,2) ,MyNumericColumn NUMERIC(10,5))"

        cur.execute(tb2)  
        self.menu() 

    def instInttable2(self):
        sql="insert into MyTable(MyBigIntColumn,MyIntColumn,MySmallIntColumn,MyDecimalColumn,MyNumericColumn) values(%s,%s,%s,%s,%s)"
        val1=(92233720368547707, 21474836,32767,123, 12345.12)
        cur.execute(sql,val1)
        con.commit()
        self.menu()


    def menu(self):  
        choice=int(input("""
                            Enter your chice: 
                            0:Delete Existing table
                            1:Create Table employee 
                            2:Insert vales into Table student
                            3:create tble clothes 
                            4:Insert vales into Table clothes 
                            5:Create table using Numeric data type
                            6: insert value into MyTable
                        """))
                        
        if choice==0:
            obj.drop_table()
        if choice==1:
            obj.create_table()
        if choice==2:
            obj.insValue()
        if choice==3:
            obj.table2()
        if choice==4:
            obj.insIntostring()
        if choice==5:
            obj.table3()
        if choice==6:
            obj.instInttable2()
 
       

if __name__=="__main__":
    print("Welcome to Data Types")
    obj=DataType()
    obj.menu()
