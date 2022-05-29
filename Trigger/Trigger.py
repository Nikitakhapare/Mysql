import mysql.connector
import json

with open ("F:\CFP\mysqlpython\sql1.json","r") as file:
    data=json.load(file)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                            )

cur=con.cursor()
print(con)

class Trigger:

    def create_table(self):
        cur.execute("create table if not exists mytable(id int not null auto_increment,fname varchar(20),age int, primary key(id))")

    
    def before_insert_tri(self):
        que="create trigger mytable_bins before insert on mytable for each row set new.fname=upper(new.fname)"
        cur.execute(que)
        myresult=cur.fetchall()
        for x in myresult:
            print(x)
        print("Trigger got created")
        
    def insert_val_mytable(self):
        cur.execute("insert into mytable(fname,age) values('pinu',18)")
        con.commit()
    
    def read_mytable(self):
        cur.execute("select * from mytable")
        val=cur.fetchall()
        for x in val:
            print(x)

    def create_mytable2(self):
        cur.execute("create table if not exists mytable2(id int not null primary key, first_name varchar(20), age int)")
    
    def after_insert_tri(self):
        que="create trigger mytable_after_insert after insert ON mytable for each row BEGIN insert into mytable2(id,first_name,age) values(new.id,new.fname,new.age);END"
        cur.execute(que);
        myresult=cur.fetchall()
        for x in myresult:
            print(x)
        print("Trigger got created")
        
    def read_mytable2(self):
        cur.execute("select * from mytable2")
        val=cur.fetchall()
        for x in val:
            print(x)


    def menu(self):
        
        choice=int(input("""
                        Enter Following Choice:
                        1. create table
                        2. Create before insert table
                        3. Insert Values into table
                        4. Read data from mytable
                        5. create table mytable2
                        6. create after insert table
                        7: read data of mytable2
            
                        """  ))

        if choice==1:
            obj.create_table()
        if choice==2:
            obj.before_insert_tri()
        if choice==3:
            obj.insert_val_mytable()
        if choice==4:
            obj.read_mytable()
        if choice==5:
            obj.create_mytable2()
        if choice==6:
            obj.after_insert_tri()
        if choice==7:
            obj.read_mytable2()
        


if __name__=="__main__":
    obj=Trigger()
    obj.menu()