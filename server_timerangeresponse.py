from flask import Flask
from flask import request
import itertools,os,subprocess

app = Flask(__name__)

@app.route('/date/')
def word_list():
  Date = request.args.get('date')
  print Date
  subprocess.call(["/home/ubuntu/server_timerangeresponse.sh", Date])
  output = subprocess.check_output(['cat', "status."+Date])
  return output

@app.route('/monitor')
def monitor():
  return "UP"

if __name__ == "__main__":
    app.run(host= '0.0.0.0')
