#!/bin/bash
########################################################################################################################
#                                                                                                                       #
# Input parameters - url to be tested                                                                                   #
# example to test 'http://35.183.95.142:12345/' - ./server_testing.sh http://35.183.95.142:12345/                         #
# This scripts tests the Magnificent url and stores                                                                     #
# the url response in a logfile with the timestamp and sends an email to the team if the response is empty              #
# Once the script is start it enters a infinite loop and runs for every 5 seconds; so please schedule this in background#
# example to schedule this in background - nohup ./server_testing.sh http://35.183.95.142:12345/ &                        #
#########################################################################################################################

while true; do
  Date=`date '+%Y-%m-%d %H:%M:%S'`

  echo -ne $Date >> status.log
  echo -ne " " >> status.log
  curl -Is $1 | head -1 >> status.log
  echo "\n" >> status.log

  response=`curl -Is $1 | head -1`

  if [[ $response == '' ]]; then
    mail -s “$url is not responsding” rithu.ritesh@gmail.com
  else
    exit 0
  fi
  sleep 5
done
