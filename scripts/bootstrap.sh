#!/usr/bin/env bash
# bootstrap.sh - initial configuration

set -e
BASEDIR="/tmp/provision"
DATADIR="/data"

# packages
apk add --no-cache \
	apache-mod-fcgid \
	apache2 \
	apache2-ctl \
	apache2-utils \
	bc \
	bind-tools \
	curl \
	font-noto-cjk \
	openssh-client \
	smokeping \
	sudo \
	tcptraceroute \
	ttf-dejavu \
	tzdata
install -m755 -D $BASEDIR/tcpping /usr/bin/


# directories
mkdir -p \
	$DATADIR/smokeping \
	/etc/smokeping/config.d \
	/var/cache/smokeping


# ssh
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
rc-service sshd restart


# apache2
cp -f $BASEDIR/apache2/smokeping.conf /etc/apache2/conf.d/


# smokeping
sed -i 's|//cropper/|/cropper/|' /etc/smokeping/basepage.html
cp -f $BASEDIR/smokeping/config /etc/smokeping/
cp -rf $BASEDIR/smokeping/config.d /etc/smokeping/

ln -sf /usr/share/webapps/smokeping /var/www/localhost/smokeping
ln -sf /var/cache/smokeping /var/www/localhost/smokeping/cache


# permissions
chmod a+s /usr/bin/traceroute
chmod a+s /usr/bin/tcptraceroute
chmod -R 777 /var/cache/smokeping && chown -R smokeping:smokeping /var/cache/smokeping
chmod -R 777 /var/lib/smokeping/.simg


# services
rc-update add apache2 default && rc-service apache2 restart
rc-update add smokeping default && rc-service smokeping restart
