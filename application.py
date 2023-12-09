import random as rs
from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def rand():
    if request.method == 'POST':
        count = 0
        com = rs.randint(1, 5)
        user = int(request.form['user_guess'])

        if user == com:
            result = "You won!"
        else:
            count += 1
            result = "Try again"

        return render_template('index.html', result=result)

    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)

