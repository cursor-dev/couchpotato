#! /bin/sh

touch /volumes/config/CouchPotato.cfg
chown -R media:users /volumes/config

su - media -c 'exec /usr/bin/python /opt/couchpotato/CouchPotato.py --data_dir /volumes/config/ --config_file=/volumes/config/CouchPotato.cfg --console_log'
