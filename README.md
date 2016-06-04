# modsecurity

mod_security ruleset based on the Comodo Web Application Firewall and OWASP ModSecurity Core Rule Set (CRS) with modifications to prevent false positives.

This ruleset has also been stripped down in order to provide support for CentOS 5,6,7.

## Installation

### CentOS 7
```
curl -sL https://raw.githubusercontent.com/sliqua-hosting/modsecurity/install/install.sh | bash
```

### CentOS 6 / CloudLinux 6
```
yum -y install git
yum -y install http://updates.atomicorp.com/channels/atomic/centos/6/x86_64/RPMS/mod_security-2.9.0-25.el6.art.x86_64.rpm
rm -rf /etc/httpd/modsecurity.d/
rm -rf /etc/httpd/conf.d/mod_security.conf
rm -rf /etc/httpd/conf.d/00_mod_security.conf && touch rm -rf /etc/httpd/conf.d/00_mod_security.conf
git clone https://github.com/sliqua-hosting/modsecurity.git /etc/httpd/modsecurity.d
ln -s /etc/httpd/modsecurity.d/conf.d/waf.conf /etc/httpd/conf.d/waf.conf
cp /etc/httpd/modsecurity.d/cron/waf /etc/cron.daily/waf
service httpd condrestart
```

### CentOS 5
```
yum -y install git
rpm -ivh http://updates.atomicorp.com/channels/atomic/centos/5/x86_64/RPMS/mod_security-2.8.0-24.el5.art.x86_64.rpm
rm -rf /etc/httpd/modsecurity.d/
rm -rf /etc/httpd/conf.d/mod_security.conf
rm -rf /etc/httpd/conf.d/00_mod_security.conf && touch rm -rf /etc/httpd/conf.d/00_mod_security.conf
git clone https://github.com/sliqua-hosting/modsecurity.git /etc/httpd/modsecurity.d
ln -s /etc/httpd/modsecurity.d/conf.d/waf.conf /etc/httpd/conf.d/waf.conf
cp /etc/httpd/modsecurity.d/cron/waf /etc/cron.daily/waf
service httpd condrestart
```

## Credits

Copyright 2015 Sliqua Enterprise Hosting, Inc. (https://www.sliqua.com)

Copyright 2015 Comodo Security Solutions (http://waf.comodo.com)

Originally based on the OWASP Foundation's Core Rule Set (CRS)

Distributed under the Apache License, see LICENSE for more information.
