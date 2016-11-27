#!/bin/bash
#
#

EMAIL="<mail>"
SNAPDIR="<snapshot dir>"
DATE=`date +%Y%m%d`
VG="/dev/vg_<volumegroup>"
LV="<lv_snapshot>"


for i in $LV

        do 

        /sbin/lvcreate --size 10G --snapshot --name "$i"_snap $VG/$i
        /bin/dd if=$VG/"$i"_snap | gzip > $SNAPDIR/$i.dd-$DATE.gz
        /sbin/lvremove -f $VG/"$i"_snap

        if [ $? -eq 0 ]

                then
                        /usr/bin/logger -s "Snapshot of $i completed"
                else
                        `/bin/echo "[SNAPSHOT FAILURE] $LV on $DATE" | /usr/bin/mail -s "[SNAPSHOT FAILURE] $LV on $DATE" $EMAIL`

        fi

done


# EOF
