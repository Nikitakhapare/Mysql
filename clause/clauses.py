import mysql.connector
import json

with open ("F:\CFP\mysqlpython\sqlfuc.json","r") as file:
    data=json.load(file)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                            )

cur=con.cursor()

class Clauses:

    def create_table(self):
        query="create table if not exists student(Id int not null auto_increment, name varchar(20),age int,department varchar(10),primary key (id))"
        cur.execute(query)
        self.menu()

    def insert_value(self):
        query="insert into student(name,age,department)values(%s,%s,%s)"
        val=[('Niki',26,'CSE'),('Siya',20,'EXTC'),('pari',22,'CIVIL'),('priyanka',27,'CSE'),('Ram',25,'EXTC'),('Tanu',23,'CSE')]
        cur.executemany(query,val)
        con.commit()
        self.menu()
    
    def read(self):
        query="select * from student"
        cur.execute(query)
        val=cur.fetchall()
        for i in val:
            print(i)
        
        self.menu()
    
    def order_by(self):
        cur.execute("select * from student order by age desc")
        val=cur.fetchall()
        for i in val:
            print (i)

        self.menu()
    
    def where(self):
        cur.execute("select name,department,age from student where age>=25 order by age desc")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    def group_by(self):
        cur.execute("select department,count(id) from student group by department order by count(id)")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    def having(self):
        cur.execute("select department,age from student group by department having age>=22 order by age")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    def union(self):
        cur.execute("select department from student union select emp_name from employee")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    def Limit(self):
        cur.execute("Select id,name,department from student  limit 3 offset 2")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    
    def menu(self):
        choice=int(input("""
                            Enter Following Choice:
                            1. Create Table
                            2. Insert Values into table
                            3. Read data from table
                            4. Order By clause
                            5: where clause
                            6: Group by clause
                            7: Having Clause
                            8: Union 
                            9: Limit and Offset


                          """  ))

        if choice==1:
            obj.create_table()
        if choice==2:
            obj.insert_value()
        if choice==3:
            obj.read()
        if choice==4:
            obj.order_by()
        if choice==5:
            obj.where()
        if choice==6:
            obj.group_by()
        if choice==7:
            obj.having()
        if choice==8:
            obj.union()
        if choice==9:
            obj.Limit()


if __name__=="__main__":
    obj=Clauses()
    obj.menu()