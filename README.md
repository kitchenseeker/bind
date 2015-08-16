# GCE BIND

***Internal DNS for ComputeEngine instances***

<img style="-webkit-user-select: none;" src="https://cloud.githubusercontent.com/assets/13706023/9293131/7371c078-4461-11e5-891b-4ece09005a86.png" width="400" height="300">
** team members: Igor, Akash, Luca


These bind configurations have the only portpose to speed the failover of the application from a site to the other

the DNS server has knowledge only of the following A records

* ns
* mysql-active
* mysql-assive

and a cname record that points on the active side

* mysql

