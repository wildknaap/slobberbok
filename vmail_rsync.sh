#!/bin/bash
#
#

SRC_PATH="/home/vmail"
DST_PATH="/home/"
DST_IP="<IP>"
BANDWIDTH_LIMIT_KBPS="10000"

#/usr/bin/rsync --dry-run --bwlimit=$BANDWIDTH_LIMIT_KBPS --archive --verbose --compress -e 'ssh' $SRC_PATH root@$DST_IP:$DEST_PATH 
/usr/bin/rsync --bwlimit=$BANDWIDTH_LIMIT_KBPS --archive --verbose --compress -e 'ssh' $SRC_PATH root@$DST_IP:/$DST_PATH 


# EOF
