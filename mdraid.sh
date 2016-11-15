#!/bin/bash
#
#

EMAIL="<mail>"
MDADM="/sbin/mdadm"
DEVICES="/dev/md0\
	/dev/md1\
	/dev/md2"

for i in $DEVICES

	do 
	
	STATUS=`$MDADM --detail $i |grep State |head -n 1 |awk '{ print $3 }'`
	
		if [ "$STATUS" == "clean" ]

			then /usr/bin/logger -s "RAID STATUS $i: $STATUS"

			else `/bin/echo "[RAID FAILURE] amorphis on $i" |/usr/bin/mail -s "[RAID FAILURE] amorphis on $i" $EMAIL`

		fi

done

# EOF
