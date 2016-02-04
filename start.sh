#! /bin/sh

mkdir -p /volumes/config
mkdir -p /volumes/media
mkdir -p /volumes/downloads

cd /opt/couchpotato
touch /volumes/config/CouchPotato.cfg

exec /usr/bin/python /opt/couchpotato/CouchPotato.py --data_dir /volumes/config/ --config_file=/volumes/config/CouchPotato.cfg --console_log
