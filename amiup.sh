MONITORIP="8.8.8.8"
MESSAGE="Ping failure, rebooting"
PINGCOUNT="4"
ALIVE=`/sbin/ping -c $PINGCOUNT $MONITORIP |/usr/bin/grep time |/usr/bin/wc -l`


if [ $ALIVE == $PINGCOUNT ];

	then 

		/usr/bin/logger "Outside world can be reached, excellent!"	

	else 

		/usr/bin/logger $MESSAGE
		/sbin/reboot
		
fi 


# EOF
