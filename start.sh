#! /bin/sh

touch /volumes/config/CouchPotato.cfg

su - media -c 'exec /usr/bin/python /opt/couchpotato/CouchPotato.py --data_dir /volumes/config/ --config_file=/volumes/config/CouchPotato.cfg --console_log'
