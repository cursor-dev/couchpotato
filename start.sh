#! /bin/sh

mkdir -p /volumes/config
mkdir -p /volumes/media
mkdir -p /volumes/downloads
touch /volumes/config/CouchPotato.cfg

chown -R root:media /volumes/config
chmod -R 0755 /volumes/config

su - media -c 'exec /usr/bin/python /opt/couchpotato/CouchPotato.py --data_dir /volumes/config/ --config_file=/volumes/config/CouchPotato.cfg --console_log'
