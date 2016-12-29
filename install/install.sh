yum -y install git
echo -n "Installing the Atomic GPG keys: "
if [ ! -f RPM-GPG-KEY.atomicorp.txt ]; then
  wget -q https://www.atomicorp.com/RPM-GPG-KEY.atomicorp.txt 1>/dev/null 2>&1
fi
rpm -import RPM-GPG-KEY.atomicorp.txt >/dev/null 2>&1
cd /etc/yum.repos.d/ && wget https://raw.githubusercontent.com/sliqua-hosting/modsecurity/master/install/atomic.repo
yum --enablerepo="atomic" install mod_security
rm -rf /etc/httpd/conf.d/00_mod_security.conf && touch /etc/httpd/conf.d/00_mod_security.conf
rm -rf /etc/httpd/modsecurity.d/
git clone https://github.com/sliqua-hosting/modsecurity.git /etc/httpd/modsecurity.d
ln -s /etc/httpd/modsecurity.d/conf.d/waf.conf /etc/httpd/conf.d/waf.conf
cp /etc/httpd/modsecurity.d/cron/waf /etc/cron.daily/waf
service httpd configtest
