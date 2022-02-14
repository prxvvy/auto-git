#!/bin/bash

HOME="/home/prxvvy"
filename="$HOME/Documents/github_creds.txt"

username=`awk 'NR==1' $filename`
password=`awk 'NR==3' $filename`

echo "Enter a message for commit:"
read message
expect <<EOS
spawn git add .
expect
spawn git commit -m "$message"
expect
spawn git push origin master
expect "Username for 'https://github.com':"
send "$username\r"
expect "Password for 'https://$username@github.com':"
send "$password\r"
expect eof
EOS
