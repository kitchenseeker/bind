# GCE BIND

***Internal DNS for ComputeEngine instances***

KitchenSeeker

team members: Igor, Akash, Luca


These bind configurations have the only portpose to speed the failover of the application from a site to the other

the DNS server has knowledge only of the following A records

* ns
* mysql-active
* mysql-assive

and a cname record that points on the active side

* mysql

