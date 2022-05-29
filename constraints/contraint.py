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
class Constraint:

    def delTb(self):
        cur.execute("drop table IF EXISTs student,designation")
        self.menu()

    #primary key , unique,not null
    def create_table(self):
        tb1="create table student(stu_id int not null ,stu_name varchar(30),city varchar(10),phone_no int unique,primary key (stu_id))"
        cur.execute(tb1)
        self.menu()
        

    #default and check constraint
    def alttable(self):
        alt="alter table student add (age int check(age >=18),section char(1) default 'A')"
        cur.execute(alt)
        self.menu()

    def insValue(self):
        query="insert into student(stu_id,stu_name,city,phone_no,age) values(%s,%s,%s,%s,%s)"
        val=[(1,'Niki','Amravati',32654896,18),(4,'siya','Nagpur',907519485,20),(5,'Pari','Pune',457921235,22)]
        cur.executemany(query,val)
        con.commit()
        self.menu()


    def foreignkey(self):
        cur.execute("create table designation(roll_no int not null,course varchar(30),stu_id int,primary key (roll_no),foreign key (stu_id)  references student(stu_id))")
        self.menu()

    def insVal2tb(self):
        sql="insert into designation(roll_no,course,stu_id) values(%s,%s,%s)"
        val=[(2,'cse',4),(4,'extc',1)]
        cur.executemany(sql,val)
        con.commit()
        self.menu()

    def menu(self):
        choice=int(input("""
                            Enter your chice: 
                            0:Delete Existing table
                            1:Create Table student 
                            2: alter table student
                            3:Insert vales into Table student 
                            4:create tble designation 
                            5:Insert vales into Table designation 
                            
                            
                        """))
                        
        if choice==0:
            obj.delTb()
        if choice==1:
            obj.create_table()
        if choice==2:
            obj.alttable()
        if choice==3:
            obj.insValue()
        if choice==4:
            obj.foreignkey()
        if choice==5:
            obj.insVal2tb()


if __name__=="__main__":
     obj=Constraint()
     obj.menu()
     print("Constraint work succsesfully: ")      