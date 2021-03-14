#!/usr/bin/env bash
# update_data.sh - update config data on the machine

set -e
DATADIR="/data"

# directories
mkdir -p \
	$DATADIR/smokeping

# smokeping config
cp -rf $DATADIR/smokeping/. /etc/smokeping/config.d
cp -rf /etc/smokeping/config.d/. $DATADIR/smokeping
rc-service smokeping restart
