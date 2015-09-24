#FROM densuke/ubuntu-jp-remix:trusty
FROM ubuntu:trusty

RUN apt-get update && apt-get -y install squid3 && initctl stop squid3
RUN sed -e 's;^start on runlevel;# start on runlevel;' \
        -e 's;^stop on runlevel;# stop on runlevel;' \
		    -i.dist /etc/init/squid3.conf
RUN rm -vf /var/run/squid3.pid
RUN apt-get clean
RUN mkdir /target
ENTRYPOINT ["/usr/sbin/squid3", "-f", "/vagrant/check.conf", "-k", "check"]

