from flask_sqlalchemy import SQLAlchemy
 
db = SQLAlchemy()

class InfoModel(db.Model):
    __tablename__ = 'customer'
 
    id = db.Column(db.String(), primary_key = True)
    name = db.Column(db.String())
    age = db.Column(db.Integer())
 
    def __init__(self, name,age):
        self.name = name
        self.age = age
 
    def __repr__(self):
        return f"{self.name}:{self.age}"
