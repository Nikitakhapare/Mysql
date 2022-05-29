import requests
import mysql.connector
import json

getdata=requests.get('https://jsonplaceholder.typicode.com/posts')
filedata=json.loads(getdata.text)

#jsondata=getdata.text

#print(filedata)
with open ("F:\CFP\mysqlpython\conn.json","r") as file:
    data=json.load(file)
        
con=mysql.connector.connect(host=data["host"],
                            user=data["user"],
                            password=data["password"],
                            database=data["database"])
print(con)

cur=con.cursor()

# tb="create table data(userId int,id int not null primary key, title varchar(300), body varchar(300))"
# cur.execute(tb)

for key in filedata:
    userId=key["userId"]
    id=key["id"]
    title=key["title"]
    body=key["body"]

    sql = '''INSERT INTO data(userid, id,title,body) 
                        VALUES ('{}', '{}', '{}','{}')
                    '''.format(userId,id,title,body)

    cur.execute(sql)
con.commit()
        