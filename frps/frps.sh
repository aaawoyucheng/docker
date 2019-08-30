set -x
docker build -t aaawoyucheng/frps .
# docker push aaawoyucheng/frps
docker rm -f frp-server
docker run -d --name frp-server --cap-add=NET_ADMIN --net host --restart=always -v `pwd`/frps.ini:/frps/frps.ini aaawoyucheng/frps
netstat -lnutp|grep frps
