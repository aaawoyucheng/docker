>/var/log/vlmcsd.log
/etc/init.d/kms start
netstat -lntp|grep 1688 >>/var/log/vlmcsd.log
tailf /var/log/vlmcsd.log