############################################################################################################
#This is a python flask script.                                                                            #
#Run this using - python server_timerangeresponse.py                                                       #
#Url to access this example for april 6th logs - http://<ip_address>:5000/date/?date=2019-04-06            #
#This runs server_timerangeresponse.sh scripts and retunrs the contents from status.<date_timestamp> file. #
############################################################################################################

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
