FROM debian
MAINTAINER Dorian ROLY <droly@student.42.fr>

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y locales && apt-get install -y wget && apt-get install -y bzip2  && apt-get install -y sudo  && apt-get install -y systemd && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN adduser --disabled-password --gecos "" teamspeak && \
	mkdir /opt/teamspeak && \
	chown teamspeak:teamspeak /opt/teamspeak/ && \
	chmod 0770 /opt/teamspeak/

COPY script2.ini /etc/systemd/system/teamspeak3server.service

RUN cat /etc/systemd/system/teamspeak3server.service

RUN chmod 664 /etc/systemd/system/teamspeak3server.service && \
	systemctl enable teamspeak3server.service && \
	chmod 777 etc/sudoers

RUN echo "elo"

COPY script.ini /etc/sudoers

RUN sudo -iu teamspeak

RUN wget http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 && \
	tar xfv teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2

RUN ls -l

RUN mv teamspeak3-server_linux_amd64/* /opt/teamspeak/ && \
	rm -rf ~/teamspeak3-server_linux_amd64* && \
	exit

CMD sh opt/teamspeak/ts3server_minimal_runscript.sh
