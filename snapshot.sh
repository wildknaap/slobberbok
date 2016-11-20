#!/bin/bash
#
#

SNAPDIR="<dir>"
DATE=`date +%Y%m%d`
VG="/dev/<vg>"
LV="<lv>"

/sbin/lvcreate --size 10G --snapshot --name "$LV"_snap $VG/$LV

/bin/dd if=$VG/"$LV"_snap of=$SNAPDIR/$LV.dd-$DATE

/bin/tar -cvjf $SNAPDIR/$LV.dd-$DATE.tar.bz2 $SNAPDIR/$LV.dd-$DATE

/sbin/lvremove -f $VG/"$LV"_snap

/bin/rm $SNAPDIR/$LV.dd-$DATE

/usr/bin/logger -s "snapshot of $LV completed"

# EOF
