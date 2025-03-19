from flask import render_template, request, redirect, url_for
from app import app, db
from app.models import User

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']
    father_name = request.form['father_name']  # Added Father's Name
    email = request.form['email']
    phone = request.form.get('phone', '')  # Optional field
    
    user = User(name=name, father_name=father_name, email=email, phone=phone)  # Updated model
    db.session.add(user)
    db.session.commit()
    
    return redirect(url_for('index'))
