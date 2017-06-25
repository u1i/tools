for d in *jpg
do
	cd /Users/uli/Desktop/photos_s7/01
	
	datum=$(exiftool $d | grep "Modify Date" | sed "s/.*: 20/20/;")

	mdname=$(echo $d | md5)

	year=$(echo $datum | sed "s/:.*//;")
	month=$(echo $datum | sed "s/:/_/;"| sed "s/:.*//;" | sed "s/.*_//;")

[ "$month" = "01" ] && monthstr="Jan"
[ "$month" = "02" ] && monthstr="Feb"
[ "$month" = "03" ] && monthstr="Mar"
[ "$month" = "04" ] && monthstr="Apr"
[ "$month" = "05" ] && monthstr="May"
[ "$month" = "06" ] && monthstr="Jun"
[ "$month" = "07" ] && monthstr="Jul"
[ "$month" = "08" ] && monthstr="Aug"
[ "$month" = "09" ] && monthstr="Sep"
[ "$month" = "10" ] && monthstr="Oct"
[ "$month" = "11" ] && monthstr="Nov"
[ "$month" = "12" ] && monthstr="Dec"

	day=$(echo $datum | sed "s/:/_/;" | sed "s/:/-/;" | sed "s/.*-//; s/ .*//;")
	echo $d $mdname $datum - $year $month $monthstr $day

	openssl bf -in $d -out git/$mdname -pass env:mypass

	cd git
	git add -A
	git commit --allow-empty --date="$monthstr $day 11:00 $year +0100" -m 'added'
	git push -u origin master

done
