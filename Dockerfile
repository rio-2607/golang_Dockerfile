FROM ubuntu:14.04
MAINTAINER rio-2607 huanglaoxie2607@gmail.com

ENV REFRESH_TIME 2015-6-11

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get install -y wget
RUN wget http://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
RUN tar -xzf go1.4.2.linux-amd64.tar.gz
RUN mv go /usr/local/go

ENV GOROOT /usr/local/go
ENV GOBIN $GOROOT/bin
ENV GOPKG $GOROOT//pkg/tool/linux_amd64
ENV GOARCH amd64
ENV GOOS linux 
ENV PATH $PATH:$GOBIN:$GOPKG

RUN rm -rf  go1.4.2.linux-amd64.tar.gz

VOLUME /var/code
WORKDIR /var/code

CMD ["go","help"]
