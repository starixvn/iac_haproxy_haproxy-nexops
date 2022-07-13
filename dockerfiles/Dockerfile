##
ARG registry
ARG haproxy_ver
FROM $registry/base/haproxy/haproxy-debian:$haproxy_ver
#hub.nexdev.net/base/haproxy/haproxy-debian:2.4-test
ARG ENV
#registry.nexdev.net:5050/docker/haproxy/haproxy-debian:2.4-test
#$registry/base/haproxy/haproxy-debian:$haproxy_ver
RUN mkdir -p /root/.ssh/
ADD dockerfiles/rsa /root/.ssh/
RUN chmod -R 600 /root/.ssh/
RUN ssh-keyscan -t rsa gitlab.nexdev.net >> /root/.ssh/known_hosts
RUN ls -l /root/.ssh/
RUN cat /root/.ssh/id_rsa
RUN cd /srv/ && git clone git@gitlab.nexdev.net:NEXOPS/haproxy/haproxy-default.git
RUN ls -l /srv/
#############
COPY configs/$ENV /usr/local/etc/haproxy/configs/$ENV
RUN ls -l /srv/haproxy-default/configs
RUN ls -l /srv/haproxy-default/configs/$ENV/
RUN cp /srv/haproxy-default/configs/$ENV/00-global-defaults.cfg /usr/local/etc/haproxy/configs/$ENV/
RUN ls /usr/local/etc/haproxy/configs/$ENV
RUN cat /usr/local/etc/haproxy/configs/$ENV/*.cfg > /usr/local/etc/haproxy/configs/$ENV/haproxy.cfg.tmp
RUN cp /usr/local/etc/haproxy/configs/$ENV/haproxy.cfg.tmp /usr/local/etc/haproxy/haproxy.cfg
RUN cp /srv/haproxy-default/whitelisted.ips /etc/haproxy/whitelisted.ips
RUN cp /srv/haproxy-default/certs/nexdev.net.pem /etc/haproxy/nexdev.net.pem
RUN cp /srv/haproxy-default/certs/nexcel.vn.pem /etc/haproxy/nexcel.vn.pem
RUN mkdir /usr/local/etc/haproxy/maps
RUN cat /usr/local/etc/haproxy/configs/$ENV/maps/*.map > /usr/local/etc/haproxy/maps/hosts.map
#RUN cp /usr/local/etc/haproxy/configs/$ENV/special-maps/vg3-game-proxy.map /usr/local/etc/haproxy/maps/vg3-game-proxy.map
RUN cat /usr/local/etc/haproxy/haproxy.cfg
RUN cat /etc/haproxy/maps/hosts.map