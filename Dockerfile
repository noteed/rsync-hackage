FROM ubuntu:12.04
MAINTAINER Vo Minh Thu <thu@hypered.io>

RUN apt-get install -q -y rsync

ADD rsyncd.conf /etc/rsyncd.conf
ADD run.sh /root/run.sh

CMD /root/run.sh
