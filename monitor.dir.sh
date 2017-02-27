#!/bin/bash
#
# run in screen session

PATH="<path>"
EMAIL="<email>"
TIME=`/bin/date +%R`
HOST="<host>"

/usr/bin/inotifywait -m $PATH -e create |

while read path action file
	
	do

	/bin/echo "[$HOST] $FILE at $TIME" |/usr/bin/mail -s "[$HOST] $FILE at $TIME" $EMAIL

done


#EOF
