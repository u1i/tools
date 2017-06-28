#!/bin/bash
# needs imagemagick
# quick hack to work on a Mac

tmpfile=/tmp/gen-thb.tmp.$$
tmpdir=/tmp/gen-thb.tmp.dir.$$

index=$tmpfile.index.html
mkdir $tmpdir

ls *JPG *jpg *PNG *png > $tmpfile 2>/dev/null

> $index

while read pic
do
	echo $pic
	convert "$pic" -geometry 10% "$tmpdir/$pic"

	echo "<a href='$PWD/$pic'><img src='$tmpdir/$pic'></a><br>" >> $index
	
done < $tmpfile

open $index
