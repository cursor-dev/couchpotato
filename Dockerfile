FROM cursor/mbase

MAINTAINER Ryan Pederson <ryan@pederson.ca>

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apt-get -q update && \
    apt-get -y install software-properties-common && \
    add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ wily universe multiverse" && \
    add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ wily universe multiverse" && \
    apt-get -q update && \
    apt-get install -qy python wget unrar git python-lxml && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN git clone git://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato

ADD start.sh /start.sh

RUN chown -R root:media /opt/couchpotato && \
    mkdir -p /volumes/downloads /volumes/config /volumes/media && \
    chown -R root:media /volumes/config && \
    chmod -R 0770 /volumes/config && \
    chmod +x /start.sh

VOLUME ["/volumes/config","/volumes/downloads","/volumes/media"]

EXPOSE 5050

RUN ["/start.sh"]
