#!/bin/bash
#
#

SNAPDIR="<dir>"
DATE=`date +%Y%m%d`
VG="/dev/<vg>"
LV="<lv>"

	/sbin/lvcreate --size 10G --snapshot --name "$i"_snap $VG/$i
	/bin/dd if=$VG/"$i"_snap | gzip > $SNAPDIR/$i.dd-$DATE.gz
	/sbin/lvremove -f $VG/"$i"_snap
	/bin/rm $SNAPDIR/$i.dd-$DATE
	/usr/bin/logger -s "Snapshot of $i completed"

# EOF
