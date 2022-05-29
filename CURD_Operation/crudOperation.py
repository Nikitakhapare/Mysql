import json
import mysql.connector


class CrudOperations:

    #open json file
    with open ("F:\CFP\mysqlpython\connector.json", "r") as datafile:
        info=json.load(datafile)

    #Establish connection with mysql
    con=mysql.connector.connect(host=info["host"],
                                user=info["user"],
                                password=info["password"],
                                database= "std")

    print("Connection establish succsesfully")
    
    #create cursor object to execute crud operation
    curobj=con.cursor()

    #create database

    # db="create database Employee"
    # curobj.execute(db)

    def createtable(self):

        tb1="create table empInfo(empid int not null auto_increment,fname varchar(20),lname varchar(20),sallary int,primary key (empid))"
        CrudOperations.curobj.execute(tb1)
        self.menu()

    # def showTables():
    #     curobj.execute("show tables")

    #     for x in curobj:
    #         print(x)


    #Insert Values into  table
    def insertValue(self):
        insValue="insert into empInfo(fname,lname,sallary) Values(%s,%s,%s)"
        val1=('niki','khapare',25000)
        val2=('pari','Bhonde',30000)
        val3=('siya','chavhan',35000)
        CrudOperations.curobj.execute(insValue,val1)
        CrudOperations.curobj.execute(insValue,val2)
        CrudOperations.curobj.execute(insValue,val3)

        CrudOperations.con.commit()
        self.menu()

    #read Operation
    def read(self):
        CrudOperations.curobj.execute("select * from empInfo")
        res=CrudOperations.curobj.fetchall()
        for x in res:
            print(x)

        self.menu()
    #to know how much record is present
    #print(curobj.rowcount)

    # sql="select * from empInfo where fname='niki'"
    # curobj.execute(sql)
    # res=curobj.fetchone()
    # print(res)

    #to fetch perticular lenghth of record use Limit ex LIMIT 5 fetch first 5 record
    #following statement return record start from 2 and return 1 record
    # sql="select * from empInfo  LIMIT 1 OFFSET 1"
    # curobj.execute(sql)
    # res=curobj.fetchall()
    # for x in res:
    #     print(x)
    # #update

    def update(self):
        updateValue="update empInfo set sallary=15000 where empid=2"
        CrudOperations.curobj.execute(updateValue)
        CrudOperations.con.commit()
        self.menu()

    #Delete

    def delate(self):
        delValue="delete from empInfo where empid=1"
        CrudOperations.curobj.execute(delValue)
        CrudOperations.con.commit()
        self.menu()

    def menu(self):
        print("1.Create Table \n 2.Insert value into table \n 3.Read data \n 4.Update \n 5.Delete")
        choice=int(input("Enter your Choice: "))
        if choice==1:
            self.createtable()
        elif choice==2:
            self.insertValue()
        elif choice==3:
            self.read()
        elif choice==4:
            self.update()
        elif choice==5:
            self.delate()
        else:
            print("Enter a valid entry")

if __name__=="__main__":
    obj1=CrudOperations()
    obj1.menu()
    # .json
    # .congig