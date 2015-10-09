#!/usr/bin/python
# Author: Gian Luca Fiasco
# email gifasco88@gmail.com
import keyring
from keyring.backend import *
import sys

hostname='kitchenseeker.ddns.net'
username='kitchenseeker'
new_ip=str(sys.argv[1])

keyring.set_keyring(UncryptedFileKeyring())
password=keyring.get_password('ddns-no-ip','root')

command="curl \"https://%s:%s@dynupdate.no-ip.com/nic/update?hostname=%s&myip=%s\"" % (username,password,hostname,new_ip)
os.system(command)
