
from flask import Flask
app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World from Python 2nd time!"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
