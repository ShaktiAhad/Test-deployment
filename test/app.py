
import os
from flask import Flask

app = Flask(__name__)
INPUT = os.getenv('INPUT')

@app.route("/")
def hello():
    return f"Hello ${INPUT} from python 2nd time!"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
