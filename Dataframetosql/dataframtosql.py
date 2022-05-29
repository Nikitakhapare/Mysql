import  pandas as pd
import json
import mysql.connector


class CSV:

    def dataframtosql(self,df1):
        
        with open ("F:\CFP\mysqlpython\conn.json","r") as file:
            data=json.load(file)
        
        con=mysql.connector.connect(host=data["host"],
                                    user=data["user"],
                                    password=data["password"],
                                    database=data["database"])
        print(con)

        curobj=con.cursor()

        # db="create database std"
        # curobj.execute(db)

        tbDel="Drop table stdInfo"
        curobj.execute(tbDel)
        con.commit()


        qur="create table stdInfo(firstname varchar(20),lastname varchar(20), full_name varchar(30))"
        curobj.execute(qur)

    
        for row,clm in df1.iterrows():
            sql = '''INSERT INTO stdInfo(firstname, lastname, full_name) 
                        VALUES ('{}', '{}', '{}')
                    '''.format(clm[0], clm[1], clm[2])

            curobj.execute(sql)
        con.commit()
        

if __name__=="__main__":

    df=pd.read_csv("data.csv")
    df["full_name"]=df.apply(lambda x:  x.firstname  +" "+ x.lastname ,axis=1)
    df1=df
    print(df1)
    obj=CSV()
    obj.dataframtosql(df1)
    print("dataframe to mysql data transfer successfully")
