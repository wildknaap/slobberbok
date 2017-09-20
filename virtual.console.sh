#!/bin/bash

JAVA="/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java"
JAVALIB="/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/"

rm avctKVM.jar

echo -n 'Host: '
read DRACHOST

echo -n 'iDRAC username: '
read DRACUSER

echo -n 'iDRAC password: '
read -s DRACPWD
echo

wget --no-check-certificate https://$DRACHOST:443/software/avctKVM.jar

$JAVA -cp avctKVM.jar -Djava.library.path=$JAVALIB com.avocent.idrac.kvm.Main ip=$DRACHOST kmport=5900 vport=5900 user=$DRACUSER passwd=$DRACPWD apcp=1 version=2 vmprivilege=true "helpurl=https://$DRACHOST:443/help/contents.html"

# EOF
