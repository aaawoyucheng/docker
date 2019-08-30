rm -rf ~/openvpn/*.ovpn
rm -rf ~/openvpn/*.conf
rm -rf ~/openvpn/*.http
docker rm -f ovpn
docker rm -f serveconfig
ip addr|grep 'inet '|awk '{print $2}'|awk -F '/' '{print $1}'
echo "IP:"
read IP
IP2=10.$(($RANDOM%255+1)).$(($RANDOM%255+1)).128
echo $IP2
docker build -t ovpn .
docker run -d --name ovpn --privileged -p $IP:1194:1194/udp -v ~/openvpn:/etc/openvpn -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro ovpn run $IP $IP2
docker run -t --name serveconfig --rm -p $IP:8080:8080 --volumes-from ovpn ovpn serveconfig $IP
