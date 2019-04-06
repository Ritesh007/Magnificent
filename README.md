Author/Maintainer - Ritesh Kumar Reddy Kuchukulla

Requirements -
python 2/3, pip, python flask, shell 'mail' module. Open port 5000 to access the flask application.

Tested on - ubuntu 16.04 OS.

Description - This repository consists of shell and python scripts that test an URL and stores the logs along with the time stamps.

# server_testing.sh -(should be scheduled in background)
Input parameters - url to be tested.                                                                                   
example to test 'http://<ip_address>:12345/' - ./server_testing.sh http://<ip_address>:12345/.                         
This scripts tests the url and stores the url response in a logfile with the timestamp and sends an email(please change the emailid in the code) to the team if the response is empty.              
Once the script starts it enters a infinite loop and runs for every 5 seconds; so please schedule this in background.
example to schedule this in background - nohup ./server_testing.sh http://<ip_address>:12345/ &.
This stores the logs in 'status.log'. This runs for every 5 seconds in the background, we cant use cron job for this as cron can't run for every 5 seconds.

# server_timerangeresponse.sh (can run this directly)
Input parameter - date.                                                            
Example to check the status on April 6th - server_timerangeresponse.sh 2019-04-06. 
This script returns all the statuses (which were recorded for every 5 seconds using the above script) of the url for a specific date and stores it in 'status.<date_timestamp>' file.

# server_timerangeresponse.py (runs server_timerangeresponse.sh scripts and retunrs the contents from status.<date_timestamp> file)
This is a python flask script.
Run this using - python server_timerangeresponse.py.
Url to access this example for April 6th logs - http://<ip_address>:5000/date/?date=2019-04-06.
This runs 'server_timerangeresponse.sh scripts' and retunrs the contents from 'status.<date_timestamp>' file.
