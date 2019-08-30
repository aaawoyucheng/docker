docker rm -f aria2-kode 
docker run --name aria2-kode -d -it -p 6800:6800 -p 6881:6881 -p 6801:6801 -p 6802:80 -v /data/aria2-kode:/app aaawoyucheng/aria2-kode
