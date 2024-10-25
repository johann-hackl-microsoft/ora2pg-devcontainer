#!/usr/bin/env bash
scriptRoot=$(dirname "$0")

set -e

echo "Install Ora2Pg..."
pwsh -WorkingDirectory $scriptRoot -File $scriptRoot/installora2pg.ps1

# Only skip sqlplus client due to: Unpacking failed at /usr/share/perl5/Alien/Package/Rpm.pm line 168
# => see https://forums.oracle.com/ords/apexds/post/unpacking-failed-at-usr-share-perl5-alien-package-rpm-pm-li-7881
echo "Manually install Oracle instant client sqlplus from local cache..."
sudo apt-get install -y rpm2cpio
wget -O $scriptRoot/oracle-instantclient-sqlplus.rpm https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-sqlplus-23.5.0.24.07-1.el9.x86_64.rpm
rpm2cpio $scriptRoot/oracle-instantclient-sqlplus.rpm | cpio -i --make-directories --directory=/

echo "Add environment variables to /root/.profile..."
echo 'export ORACLE_HOME=/usr/lib/oracle/23/client64/lib/' >> /root/.profile
echo 'export LD_LIBRARY_PATH="$ORACLE_HOME"' >> /root/.profile
echo 'export PATH="$ORACLE_HOME:$PATH"' >> /root/.profile

echo "Done!"