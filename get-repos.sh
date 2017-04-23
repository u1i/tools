#!/bin/bash

tmpfile=/tmp/getgitrepos.tmp

if [ "$1" = "" ]
then
	echo "Please enter the organization or user name on Github"
	read username
else
	username=$1
fi

#for d in $(seq 2)
#do
#	wget -O $tmpfile.$d "https://github.com/$username?page=$d"
#done

grep "$username" $tmpfile.* | grep href | tr "'" "\n" | tr '"' "\n" | grep $username | grep -v get-github-repositories | sort -u
