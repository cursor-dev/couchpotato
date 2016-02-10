FROM cursor/mbase
MAINTAINER Ryan Pederson <ryan@pederson.ca>

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apt-get -q update && \
    apt-get install -qy --force-yes python python-pip && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN git clone git://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato

VOLUME ["/volumes/config","/volumes/media","/volumes/downloads"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

CMD ["/start.sh"]
