FROM cursor/mbase
yMAINTAINER Ryan Pederson <ryan@pederson.ca>

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN git clone git://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato

RUN apt-get install python

RUN pip install --upgrade pyopenssl

VOLUME ["/volumes/config", "/volumes/media", "/volumes/downloads"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

CMD ["/start.sh"]
