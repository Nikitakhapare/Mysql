import json
import mysql.connector

with open("F:\CFP\mysqlpython\niki.json","r")as file:
    data=json.load(file)

con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"]
                           )

cur=con.cursor()

class Functions:

    #numeric

    def greteset(self):
        readvalue="select greatest(12,35,68,89,69,32)"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def lowest(self):
        readvalue="select least(12,35,68,89,69,32)"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def squareroot(self):
        readvalue="select sqrt(36);"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    
    def sign(self):
        readvalue="SELECT SIGN(-50)"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def mod(self):
        readvalue="select mod(13,3)"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    #dateandTime

    def week_of_yr(self):
        readvalue="SELECT WEEKOFYEAR(NOW())"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()
    
    def curr_hr(self):
        readvalue="SELECT HOUR(CURRENT_TIME())"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def day_name(self):
        readvalue="SELECT DAYNAME(NOW())"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()

    def curr_year(self):
        readvalue="SELECT year(NOW())"
        cur.execute(readvalue)
        res =cur.fetchall()
        for val in res:
            print(val)

        self.menu()


    



    def menu(self):
        
        choice = int(input("""
                                Enter your choice: 
                                1:Greatest value
                                2:Least value
                                3:Finding the squareroot of value
                                4:Finding the sign of number
                                5.find the mod of number
                                6.Find week of year
                                7.Find current Hr
                                8.find current day name
                                9.finding current year
                                
                            """))

        if choice == 1:
            obj.greteset()
        if choice == 2:
            obj.lowest()
        if choice == 2:
            obj.minimum_val()
        elif choice == 3:
            obj.squareroot()
        if choice == 4:
            obj.sign()
        if choice == 5:
            obj.mod()
        if choice==6:
            obj.week_of_yr()
        if choice==7:
            obj.curr_hr()
        if choice==8:
            obj.day_name() 
        if choice==9:
            obj.curr_year()
    



if __name__ == '__main__':
      obj = Functions()
      obj.menu()