FROM ubuntu:14.04
MAINTAINER ZETTAGE

# update apt source and install dependences
RUN apt-get -yqq update \
	&& apt-get -yqq upgrade \
	&& apt-get install  -yqq libreadline-dev \
                libncurses5-dev \
                libpcre3-dev \
                libssl-dev \
                perl \
                make \
                build-essential \
    && apt-get autoclean

ADD https://openresty.org/download/openresty-1.9.7.3.tar.gz /
RUN tar -zxvf openresty-1.9.7.3.tar.gz
WORKDIR /openresty-1.9.7.3
RUN ./configure && \
     make && \
     make install

ENTRYPOINT  ["sudo","-E","/usr/local/openresty/nginx/sbin/nginx"] 
CMD ["-g", "daemon off;"]
EXPOSE 80
