FROM debian

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y git wget gcc
RUN apt-get update && apt-get upgrade

#USER root

#RUN echo "mysql-server mysql-server/root_password password strangehat" | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password strangehat" | debconf-set-selections

RUN apt-get -y install sqlite3
#apt-get -y install mysql-server \
#&& echo "DROP DATABASE IF EXISTS gogs;" >> gogs.sql \
#&& echo "CREATE DATABASE IF NOT EXISTS gogs CHARACTER SET utf8 COLLATE utf8_general_ci;" >> gogs.sql \
#&& service mysql start \
#&& chmod -R 755 /var/lib/mysql/mysql/ \
#&& mysql -u root < gogs.sql \
#&& mysqladmin -u root -p"" password "test" \
#&& cat /etc/mysql/my.cnf
#&& mysqladmin -u root password 123cancer -p strangehat

#RUN ln -snf /bin/bash /bin/sh

RUN adduser --disabled-login --gecos 'Gogs' git

USER git


#ENV GOROOT=$HOME/local/go
#ENV GOPATH=$HOME/gogs
#ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin


RUN cd ~ && mkdir local && wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz \
&& tar -C /home/git/local -xzf go1.9.linux-amd64.tar.gz \
&& echo "export GOROOT=$HOME/local/go" >> $HOME/.bashrc \
&& export GOROOT=$HOME/local/go \
&& echo "export GOPATH=$HOME/go" >> $HOME/.bashrc \
&& export GOPATH=$HOME/go \
&& echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> $HOME/.bashrc \
&& export PATH=$PATH:$GOROOT/bin:$GOPATH/bin \
#&& go get -u github.com/gogits/gogs \
#&& mkdir $GOPATH/src/github.com/gogits \
#&& cd $GOPATH/src/github.com/gogits \
&& mkdir -p $GOPATH/src/github.com/gogits \
&& cd $GOPATH/src/github.com/gogits \
&& git clone --depth=1 -b develop https://github.com/gogits/gogs \
&& cd gogs && ls -la && ~/local/go/bin/go build \
&& ~/local/go/bin/go get -u -tags "sqlite" github.com/gogits/gogs \
&& cd $GOPATH/src/github.com/gogits/gogs \
&& ~/local/go/bin/go build -tags "sqlite"

#RUN mkdir $GOPATH/src/github.com/gogits/logs
#RUN mkdir /root/gogs-repositories
#RUN mkdir /root/data

USER root

#CMD /bin/bash
CMD ls -la /home/git/go/src/github.com/gogits/gogs && su git -c "./home/git/go/src/github.com/gogits/gogs/gogs web"


#https://pdemro.com/gogs-how-to-set-up-an-ssh-key-when-using-docker-bonus-caddy-config/
#https://help.github.com/articles/connecting-to-github-with-ssh/
