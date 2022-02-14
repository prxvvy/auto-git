#!/bin/bash

HOME="/home/prxvvy"
filename="$HOME/Documents/github_creds.txt"

username=`awk 'NR==1' $filename`
email=`awk 'NR==2' $filename`

echo "Initialing git repo..."

expect <<EOS
spawn git init
expect
spawn git config --global user.name "$username"
expect
spawn git config --global user.email "$email"
expect eof
EOS
