FROM ubuntu:bionic
RUN apt-get update -q
RUN apt-get install -qy openvpn iptables socat curl vim
ADD ./bin /usr/local/sbin
VOLUME /etc/openvpn
EXPOSE 1194/udp 8080/tcp
CMD run
