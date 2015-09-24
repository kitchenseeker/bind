#!/bin/bash
US=''
ASIA=''
SWITCH=$(sed -ne 's/.*mysql-\(.*\).kitchenseeker.com./\1/p' /etc/bind/db.kitchenseeker.com)

if [ $SWITCH == 'active' ]; then
	SWITCH='passive'
	#./ddns $US
elif [ $SWITCH == 'passive' ]; then
	SWITCH='active'
	#./ddns $ASIA
else
	echo 'What that heck is going on here'
fi

sed -i "s/mysql-.*\.kitchenseeker\.com/mysql-$SWITCH\.kitchenseeker\.com/g" /etc/bind/db.kitchenseeker.com

service bind9 reload
