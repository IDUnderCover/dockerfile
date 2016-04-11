####change the apt sources
COPY sources.list /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40976EAF437D05B5  
RUN apt-get -yqq update && apt-get -yqq upgrade
