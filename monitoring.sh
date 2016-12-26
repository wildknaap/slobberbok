#!/bin/bash
#
#

URL4="<ips4>"
URL6="<ips6>"
WHITELIST4="<whitelist4>"
WHITELIST6="<whitelist6>"
CONCAT4="<concat4>"
CONCAT6="<concat6>"

# get locations
/usr/bin/wget -O $WHITELIST4 $URL4
/usr/bin/wget -O $WHITELIST6 $URL6

# remove dos carriage-return character
/usr/bin/dos2unix $WHITELIST4
/usr/bin/dos2unix $WHITELIST6

# create concated list
/usr/bin/paste -d, -s $WHITELIST4 > $CONCAT4
/usr/bin/paste -d, -s $WHITELIST6 > $CONCAT6

# EOF
