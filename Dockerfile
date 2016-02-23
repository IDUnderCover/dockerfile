FROM ubuntu:14.04
MAINTAINER ZETTAGE

COPY sources.list /etc/apt/sources.list
# update apt source
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40976EAF437D05B5  
RUN apt-get -yqq update && apt-get -yqq upgrade

# install openresty dependences
RUN apt-get install  -yqq libreadline-dev \
                libncurses5-dev \
                libpcre3-dev \
                libssl-dev \
                perl \
                make \
                build-essential \
				autoclean

ADD https://openresty.org/download/openresty-1.9.7.3.tar.gz /
RUN tar -zxvf openresty-1.9.7.3.tar.gz
WORKDIR /openresty-1.9.7.3
RUN ./configure && \
     make && \
     make install

ENTRYPOINT  ["sudo","-E","/usr/local/openresty/nginx/sbin/nginx"] 
CMD ["-g", "daemon off;"]
EXPOSE 80
