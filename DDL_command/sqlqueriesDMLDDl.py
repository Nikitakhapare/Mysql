import json
import mysql.connector

class SQLqueries:

    with open ("F:\CFP\mysqlpython\sql.json", "r") as datafile:
            info=json.load(datafile)

        #Establish connection with mysql
    con=mysql.connector.connect(host=info["host"],
                                    user=info["user"],
                                    password=info["password"],
                                    database=info["database"])

    print("Connection establish succsesfully")
        
    #create cursor object to execute crud operation
    cur=con.cursor()

    #create database
    # db="create database sqlQueries"
    # cur.execute(db)

    def dropTable(self):

        dropTB="drop table customer1"
        SQLqueries.cur.execute(dropTB)
        self.menu()

    def createTable(self):

        
        #create Table

        table="create table customer(cusId int not null auto_increment,cusName varchar(20), city varchar(10),primary key (cusId))"
        SQLqueries.cur.execute(table)
        
        self.menu()

    # def descTable(self):
    #     tb="desc customer"
    #     SQLqueries.cur.execute(tb)
    #     SQLqueries.con.commit()
    #     self.menu()

    def insertValue(self):

        #remove previous data

        removedata="truncate table customer"
        SQLqueries.cur.execute(removedata)
        

        insertData="insert into customer(cusName,city) values(%s,%s)"
        vallist=[('Nikita','Amravati'),('pari','nagpur'),('siya','chavhan')]
        SQLqueries.cur.executemany(insertData,vallist)
        SQLqueries.con.commit()

        self.menu()
    
    def read(self):
        readdata="select * from customer"
        SQLqueries.cur.execute(readdata)
        val=SQLqueries.cur.fetchall()

        for x in val:
            print(x)

        self.menu()

    def update(self):
        updVal="update customer set city='pune' where cusName='siya'"
        SQLqueries.cur.execute(updVal)
        SQLqueries.con.commit()
        self.menu()

    def delete(self):

        delEnt="delete from customer where cusid=3"
        SQLqueries.cur.execute(delEnt)
        SQLqueries.con.commit()
        self.menu()


    def alter(self):

        # for adding
        addcol="alter table customer add (age int, orddate date, cusbill int)"
        SQLqueries.cur.execute(addcol)

        # for update

        updcol="alter table customer modify cusName varchar(30)"
        SQLqueries.cur.execute(updcol)
        self.menu()

    def insValuCol(self):
        val="update customer set orddate=now() where cusid=1 "
        val2="update customer set orddate=now() where cusid=2 "
        SQLqueries.cur.execute(val) 
        SQLqueries.cur.execute(val2) 
        SQLqueries.con.commit()
        self.menu()

    def delCol(self):
        delCol="alter table customer drop age, drop cusbill"
        SQLqueries.cur.execute(delCol)
        self.menu()

    def rename(self):
        renm="alter table customer rename to customer1"
        SQLqueries.cur.execute(renm)
        SQLqueries.con.commit()
        self.menu()

    def menu(self):
        choice=int(input("""
                            Enter your chice: 
                            0:Clear data 
                            1:Create Table  
                            2:Insert Table  
                            3:read
                            4:Update table data  
                            5:Delete Data 
                            6:Add column
                            7:Delet Column
                            8.Insert value to column
                            9:rename 
                            
                        """))
                        
        if choice==0:
            obj.dropTable()
        if choice==1:
            obj.createTable()
        if choice==2:
            obj.insertValue()
        if choice==3:
            obj.read()
        if choice==4:
            obj.update()
        if choice==5:
            obj.delete()
        if choice==6:
            obj.alter()
        if choice==7:
            obj.delCol()
        if choice==8:
            obj.insValuCol()
        if choice==9:
            obj.rename()
        

if __name__=="__main__":

    obj=SQLqueries()
    obj.menu()
    print("Query Run successfully")
