; BIND reverse data file for empty rfc1918 zone
;
; DO NOT EDIT THIS FILE - it is used for multiple zones.
; Instead, copy it, edit named.conf, and use that copy.
;
$TTL    55	
@	IN	SOA	kitchenseeker.com. root.kitchenseeker.com. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			  86400 )	; Negative Cache TTL
;
@		IN	NS	ns.kitchenseeker.com.
ns		IN 	A	10.240.69.241;
mysql-active   	IN	A	10.240.156.169;
mysql-passive	IN	A	10.240.5.88;

;MySql is the record were the application nodes will be pointed to
;which can be change due to an outage or a maintanance window

MySQL		IN	CNAME	mysql-active.kitchenseeker.com.
