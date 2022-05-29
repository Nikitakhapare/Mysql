import mysql.connector
import json

file=open ("F:\CFP\mysqlpython\sqlfuc.json","r")
filedata=file.read()
data=json.loads(filedata)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                           )

cur=con.cursor()
print(con)

class Index:

    def create_index(self):
        cur.execute("create index idx_fname on personforIndex (fname)")

    def drop_index(self):
        cur.execute("drop index idx_fname on personforIndex")

    def select(self):
        cur.execute("select count(*) from personforIndex where age Between '20' and '25'")
        val=cur.fetchall()
        for i in val:
            print("count ",i)

    def Update(self):
        cur.execute("update personforIndex set lname='chintanvar' where fname='yash'")
        con.commit()

    def select2(self):
        cur.execute("select count(*) from personforIndex where age Between '20' and '25'")
        val=cur.fetchall()
        for i in val:
            print("count ",i)

    def show_index(self):
        cur.execute("show index from personforIndex")
        val=cur.fetchall()
        for i in val:
            print(i)


    def menu(self):
        choice=int(input("""
                            Enter Following Choice:
                            1. create index
                            2. drop index
                            3. select statement
                            4. update value
                            5: select 
                            6: Show Index
                    
                          """  ))

        if choice==1:
            obj.create_index()
        if choice==2:
            obj.drop_index()
        if choice==3:
            obj.select()
        if choice==4:
            obj.Update()
        if choice==5:
            obj.select2()
        if choice==6:
            obj.show_index()
        


if __name__=="__main__":
    obj=Index()
    obj.menu()
    print("index created ")
