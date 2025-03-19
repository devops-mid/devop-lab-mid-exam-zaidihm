from app import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    father_name = db.Column(db.String(100), nullable=False)  # Added Father's Name
    email = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(15))  # Optional field
