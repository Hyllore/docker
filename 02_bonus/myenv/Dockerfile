FROM debian

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install vim curl wzip git zsh

#RUN
#RUN curl -L http://install.ohmyz.sh | sh

#RUN curl http://install.sublivim.com | sh

RUN mkdir github

WORKDIR github/

RUN curl "https://api.github.com/users/Hyllore/repos?page=$PAGE&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
