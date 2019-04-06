#!/bin/bash
######################################################################################
#                                                                                    #
#  Input parameter - date                                                            #
#  Example to check the status on april 6th - server_timerangeresponse.sh 2019-04-06 #
#  This script returns the status of magnificent url for a specific date.           #
#                                                                                    #
######################################################################################

grep -i $1 status.log > status.$1
