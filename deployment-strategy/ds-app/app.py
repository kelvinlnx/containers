from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def show_message():
    message = os.getenv('MY_MESSAGE', 'Default message if not set')
    return render_template('index.html', message=message)
