import json
import mysql.connector

with open("F:\CFP\mysqlpython\sqlfuc.json","r")as file:
    data=json.load(file)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                           )

cur=con.cursor()
class Functions:
    
    def average(self):
        readValue = 'select avg(sallary) from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)

    def maximum_val(self):
        readValue = 'select max(sallary) from employee'
        cur.execute(readValue)
        res = cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def minimum_val(self):
        readValue = 'select min(sallary) from employee'
        cur.execute(readValue)
        res = cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def sum_value(self):
        readValue = 'select sum(distinct(sallary)) from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def total_count(self):
        readValue = 'select count(sallary) from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)

    #string Fuction

    def uppercase(self):
        readValue = 'select upper(emp_name) from employee'
        cur.execute(readValue)
        res = cur.fetchall()
        for val in res:
            print(val)
        self.menu()

    def lowercase(self):
        readValue = 'select lower(emp_name) from employee'
        cur.execute(readValue)
        res = cur.fetchall()
        for val in res:
            print(val)

        self.menu()
    
    def length(self):
        readValue = 'select length(emp_name) from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)
        
        self.menu()

    def replace(self):
        readValue = 'select replace(emp_name,"i","I") from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def reverse(self):
        readValue = 'select reverse(emp_name) from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)
        self.menu()

    def mid(self):
        readValue = 'select mid(emp_name,2,5) from employee'
        cur.execute(readValue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    #numeric
    
    def greteset(self):
        readvalue="select greatest(12,35,68,89,69,32)"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def menu(self):
        
        choice = int(input("""
                                Enter your choice: 
                                1:Calculate the average
                                2:Finding the max value
                                3:Finding the min value
                                4:Finding the sum
                                5.count the number of rows
                                6.Convert string in uppercase
                                7.Convert string in lowercase
                                8.find lenght of strig
                                9.replace character of string
                                10.reverse a string
                                11.select mid character of string

                            """))

        if choice == 0:
            obj.average()
        if choice == 1:
            obj.maximum_val()
        if choice == 2:
            obj.minimum_val()
        elif choice == 3:
            obj.sum_value()
        if choice == 4:
            obj.total_count()
        if choice == 5:
            obj.max()
        if choice == 6:
            obj.uppercase()
        if choice == 7:
            obj.lowercase()
        if choice == 8:
            obj.length()
        elif choice == 9:
            obj.replace()
        if choice == 10:
            obj.reverse()
        if choice == 11:
            obj.mid()
        if choice==12:
            obj.greteset()
    



if __name__ == '__main__':
      obj = Functions()
      obj.menu()