FROM debian

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y git wget gcc ssh
RUN apt-get update && apt-get upgrade

RUN apt-get -y install sqlite3

RUN adduser --disabled-login --gecos 'Gogs' git

USER git

RUN cd ~ && mkdir local && wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz \
&& tar -C /home/git/local -xzf go1.9.linux-amd64.tar.gz \
&& echo "export GOROOT=$HOME/local/go" >> $HOME/.bashrc \
&& export GOROOT=$HOME/local/go \
&& echo "export GOPATH=$HOME/go" >> $HOME/.bashrc \
&& export GOPATH=$HOME/go \
&& echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> $HOME/.bashrc \
&& export PATH=$PATH:$GOROOT/bin:$GOPATH/bin \
&& mkdir -p $GOPATH/src/github.com/gogits \
&& cd $GOPATH/src/github.com/gogits \
&& git clone --depth=1 -b develop https://github.com/gogits/gogs \
&& cd gogs && mkdir custom && mkdir custom/conf &&  ~/local/go/bin/go build \
&& ~/local/go/bin/go get -u -tags "sqlite" github.com/gogits/gogs \
&& cd $GOPATH/src/github.com/gogits/gogs \
&& ~/local/go/bin/go build -tags "sqlite" \
&& echo "[server]\nDOMAIN = 192.168.99.100\nSSH_PORT = 10022\nSTART_SSH_SERVER = true\n[database]\nDB_TYPE = sqlite3\nPATH = /home/git/gogs/data/gogs.db" > custom/conf/app.ini
USER root
RUN echo "git:lol" | chpasswd && echo "root:root" | chpasswd

EXPOSE 3000
EXPOSE 3306
EXPOSE 2222

CMD su git -c "cd /home/git/go/src/github.com/gogits/gogs/ && ./gogs web"


# docker build -t gog .
# docker run -p 3000:3000 -p 10022:22 -it  gog
