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

class Views:
    def create_view(self):
        cur.execute("Create or replace view emp_view1 as select * from employee where sallary >=25000")
        self.menu()

    def read_view(self):
        cur.execute("select * from emp_view1")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()


    def insertInto_view(self):
        cur.execute("insert into emp_view1(id,emp_name,department,sallary)values(15,'sai','HR',30000)")
        con.commit()
        self.menu()

    def update_view(self):
        cur.execute("update emp_view1 set sallary=40000 where id=15")
        con.commit()
        self.menu()

    def delet_view(self):
        cur.execute("delete from emp_view1 where id=15")
        con.commit()
        self.menu()

    def menu(self):
        choice=int(input("""
                            Enter Following Choice:
                            1. Create view
                            2. Read data of view
                            5. Inset into view
                            4. Update view
                            5. Delete view
                        


                          """  ))

        if choice==1:
            obj.create_view()
        if choice==2:
            obj.read_view()
        if choice==3:
            obj.insertInto_view()
        if choice==4:
            obj.update_view()
        if choice==5:
            obj.delet_view()
        
if __name__=="__main__":
    obj=Views()
    obj.menu()   
    print("view created")     