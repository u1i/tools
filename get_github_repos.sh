#!/bin/bash

# Get all Github repositories for one user or organization
# Usage: ./get_github_repos.sh [user]
# e.g. ./get_github_repos.sh u1i

tmpfile=/tmp/getgitrepos.tmp.$$

if [ "$1" = "" ]
then
	echo "Please enter the organization or user name on Github"
	read username
else
	username=$1
fi

echo Working...
for d in $(seq 20)
do
	wget --quiet -O $tmpfile.$d "https://github.com/$username?page=$d"
done

cat $tmpfile.* | grep "href=\"\/$username" | sed "s/>.*//;" | tr '"' "\n" | grep $username | sed "s/\/$username//;" | sed "s/^\///;" | sed "s/\/.*//; s/\?.*//;" | sort -u | grep -v "\.atom"

rm $tmpfile.*
