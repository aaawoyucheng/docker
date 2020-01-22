docker build -t aaawoyucheng/pcs .
docker rm -f pcs
docker run --name pcs -p 9003:5299 -v /opt/repo:/opt/repo aaawoyucheng/pcs