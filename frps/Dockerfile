FROM busybox

RUN mkdir /frps
ADD ./frps /frps/
RUN chmod a+x /frps/frps
VOLUME /frps

WORKDIR /frps
cmd ./frps -c frps.ini

