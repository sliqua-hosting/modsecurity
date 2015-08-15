# modsecurity
mod_security rules for Sliqua Server Environment

## Installation

### CentOS 7
```
yum install http://updates.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/mod_security-2.9.0-25.el7.art.x86_64.rpm
rm -rf /etc/httpd/modsecurity.d/
git clone https://github.com/sliqua-hosting/modsecurity.git /etc/httpd/modsecurity.d
ln -s /etc/httpd/modsecurity.d/conf.d/waf.conf /etc/httpd/conf.d/waf.conf
cp /etc/httpd/modsecurity.d/cron/waf /etc/cron.daily/waf
service httpd condrestart
```

### CentOS 6 / CloudLinux 6
```
yum install http://updates.atomicorp.com/channels/atomic/centos/6/x86_64/RPMS/mod_security-2.9.0-25.el6.art.x86_64.rpm
rm -rf /etc/httpd/modsecurity.d/
git clone https://github.com/sliqua-hosting/modsecurity.git /etc/httpd/modsecurity.d
ln -s /etc/httpd/modsecurity.d/conf.d/waf.conf /etc/httpd/conf.d/waf.conf
cp /etc/httpd/modsecurity.d/cron/waf /etc/cron.daily/waf 
service httpd condrestart
```

### CentOS 5
```
rpm -ivh http://updates.atomicorp.com/channels/atomic/centos/5/x86_64/RPMS/mod_security-2.8.0-24.el5.art.x86_64.rpm
rm -rf /etc/httpd/modsecurity.d/
git clone https://github.com/sliqua-hosting/modsecurity.git /etc/httpd/modsecurity.d
ln -s /etc/httpd/modsecurity.d/conf.d/waf.conf /etc/httpd/conf.d/waf.conf
cp /etc/httpd/modsecurity.d/cron/waf /etc/cron.daily/waf 
service httpd condrestart
```

## Credits
Based on Comodo Web Application Firewall with modifications due to False Positives.

Distributed under the Apache License, see LICENSE for more information.
