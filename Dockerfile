#FROM densuke/ubuntu-jp-remix:trusty
FROM densuke/ubuntu-jp-remix:trusty

ENV http_proxy http://192.168.1.250:3128/
ENV https_proxy http://192.168.1.250:3128/
RUN apt-get update && apt-get -y install squid3 && initctl stop squid3
RUN sed -e 's;^start on runlevel;# start on runlevel;' \
        -e 's;^stop on runlevel;# stop on runlevel;' \
		    -i.dist /etc/init/squid3.conf
RUN rm -vf /var/run/squid3.pid
RUN apt-get clean
RUN mkdir /target
ENTRYPOINT ["/usr/sbin/squid3", "-f", "/vagrant/check.conf", "-k", "check"]

