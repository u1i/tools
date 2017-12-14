#! /bin/bash
# from https://gist.githubusercontent.com/yuryoparin/ffb0c8e4c8f05c4dd21e/raw/040d3f427ec1384fb05a88d177c66278581a554f/base64url.sh

table=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 - _ =)

#text="{\"alg\":\"RS256\",\"typ\":\"JWT\"}"
#text="{\"iss\":\"761326798069-r5mljlln1rd4lrbhg75efgigp36m78j5@developer.gserviceaccount.com\",\"scope\":\"https://www.googleapis.com/auth/prediction\",\"aud\":\"https://accounts.google.com/o/oauth2/token\",\"exp\":1328554385,\"iat\":1328550785}"

read text

# breaking binary represantation of $text in to 6-bit blocks
for line in $(echo -n "$text" | xxd -b -g 0 | cut -d ' ' -f 2 | paste -s -d '' | fold -w 6 -s)
do
  length=$(echo ${#line})
  let padding=6-$length
  s="0"
  p=""

  # padding 6-bit to 8-bit by adding zeros to the right
  if (($padding > 0)); then
    while ((${#p} < "$padding")); do
      p="$p$s";
    done;
  fi

  # convert binary to decimal
  n=$(echo "ibase=2;$line$p" | bc)
  # output the table looked up character
  echo -n ${table[n]}
done
