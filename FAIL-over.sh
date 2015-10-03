#!/bin/bash
US=$(gcloud compute forwarding-rules list passive-http | awk 'NR==2 {print $2}' )
ASIA=$(gcloud compute forwarding-rules list active-http | awk 'NR==2 {print $2}' )
SWITCH=$(sed -ne 's/.*mysql-\(.*\).kitchenseeker.com./\1/p' /etc/bind/db.kitchenseeker.com)

if [ $SWITCH == 'active' ]; then
	SWITCH='passive'
	/etc/bind/ddns.py $US
	echo -e "\nLive fail to $SWITCH return code: $?"
elif [ $SWITCH == 'passive' ]; then
	SWITCH='active'
	/etc/bind/ddns.py $ASIA
	echo -e "\nLive fail to $SWITCH return code: $?"
else
	echo 'What that heck is going on here'
fi

sed -i "s/mysql-.*\.kitchenseeker\.com/mysql-$SWITCH\.kitchenseeker\.com/g" /etc/bind/db.kitchenseeker.com

service bind9 reload
