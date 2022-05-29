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

class Joins:

    def natural_join(self):
        cur.execute("select * from person natural join proffesion ")
        val=cur.fetchall()
        for i in val:
            print(i)
        self.menu()

    def inner_join(self):
        cur.execute("select person.id,name,work,dept from person inner join proffesion on person.id=proffesion.id")
        val=cur.fetchall()
        for i in val:
            print(i)
        self.menu()

    def Left_join(self):
        cur.execute("select person.id,name,work,dept from person Left join proffesion on person.id=proffesion.id")
        val=cur.fetchall()
        for i in val:
            print(i)
        self.menu()
    
    def right_join(self):
        cur.execute("select * from person right join proffesion on person.id=proffesion.id")
        val=cur.fetchall()
        for i in val:
            print(i)
        self.menu()

    def full_join(self):
        cur.execute("select * from person left join proffesion on person.id=proffesion.id UNION select * from person right join proffesion on person.id=proffesion.id")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    def equi_join(self):
        cur.execute("select * from person,proffesion where person.id=proffesion.id ")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()

    def cross_join(self):
        cur.execute("select person.id, name, work,dept from person cross join proffesion")
        val=cur.fetchall()
        for i in val:
            print(i)

        self.menu()
    



    def menu(self):
        choice=int(input("""
                            Enter Following Choice:
                            1. Natural join
                            2. Inner Join
                            3. Left Join
                            4. Right Join
                            5: Full Join
                            6: Equi Join
                            7: Cross Join
                            8: Union 
                            9: Limit and Offset


                          """  ))

        if choice==1:
            obj.natural_join()
        if choice==2:
            obj.inner_join()
        if choice==3:
            obj.Left_join()
        if choice==4:
            obj.right_join()
        if choice==5:
            obj.full_join()
        if choice==6:
            obj.equi_join()
        if choice==7:
            obj.cross_join()
            

    



if __name__=="__main__":
    obj=Joins()
    obj.menu()
