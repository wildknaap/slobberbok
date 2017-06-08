#!/bin/bash
#
# use case: major maildir fuckup

USERS=`cat mailuser.list`
DOMAIN="<domain>" 
SRCDIR="/tmp/backup-restores/home/vmail/$DOMAIN/"
DSTDIR="/home/vmail/$DOMAIN/"


for i in $USERS

	do 

	/usr/bin/rsync -av $SRCDIR/$i/Maildir/ $DSTDIR/$i/Maildir	

	/usr/bin/doveadm -Dv index -u $i@$DOMAIN INBOX

	echo "Maildir restore for $i@$DOMAIN completed"	
	
done


# EOF
