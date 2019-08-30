#!/bin/sh
set -e

# env
RPC_SECRET=${RPC_SECRET:-"123456"}

echo "***** set php web config *****"
sed -i '/^User/c User root' /etc/apache2/apache2.conf
sed -i '/^Group/c Group root' /etc/apache2/apache2.conf
apache2_conf="/etc/apache2/sites-available/000-default.conf"
cat << EOF > $apache2_conf
<VirtualHost *:${KODE_PORT}>
	ServerAdmin webmaster@localhost
	DocumentRoot /web/kode
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	<Directory /web/kode/>
		Options Indexes FollowSymLinks
		AllowOverride None
		Require all granted
	</Directory>
</VirtualHost>

<VirtualHost *:${ARIANG_PORT}>
	ServerAdmin webmaster2@localhost
	DocumentRoot /web/ariaNg
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	<Directory /web/ariaNg/>
		Options Indexes FollowSymLinks
		AllowOverride None
		Require all granted
	</Directory>
</VirtualHost>
EOF

echo "***** set php web port *****"
port_conf="/etc/apache2/ports.conf"
cat << EOF > $port_conf
Listen ${KODE_PORT}
Listen ${ARIANG_PORT}

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>
EOF

aria2_conf="/app/conf/aria2.conf"
aria2_session="/app/conf/aria2.session"

if [ -f "$aria2_conf" ]; then
	echo "***** Loading aria2 config *****"
else
	echo "***** Creating default aria2 config *****"
	mkdir -p /app/conf
	cat << EOF > $aria2_conf
	dir=/app/aria2down
	continue=true
	input-file=/app/conf/aria2.session
	save-session=/app/conf/aria2.session
	disable-ipv6=false
	enable-rpc=true
	rpc-allow-origin-all=true
	rpc-listen-all=true
	rpc-listen-port=$RPC_PORT
	listen-port=6881
	dht-listen-port=6881
	rpc-secret=$RPC_SECRET
	bt-tracker=udp://tracker.coppersurfer.tk:6969/announce,udp://tracker.open-internet.nl:6969/announce,udp://tracker.leechers-paradise.org:6969/announce,udp://tracker.opentrackr.org:1337/announce,udp://tracker.internetwarriors.net:1337/announce,udp://9.rarbg.to:2710/announce,udp://9.rarbg.me:2710/announce,udp://tracker.openbittorrent.com:80/announce,http://tracker3.itzmx.com:6961/announce,http://tracker1.itzmx.com:8080/announce,udp://exodus.desync.com:6969/announce,udp://tracker.torrent.eu.org:451/announce,udp://retracker.lanta-net.ru:2710/announce,udp://bt.xxx-tracker.com:2710/announce,http://tracker2.itzmx.com:6961/announce,udp://tracker.tiny-vps.com:6969/announce,udp://tracker.cyberia.is:6969/announce,udp://open.stealth.si:80/announce,udp://open.demonii.si:1337/announce,udp://explodie.org:6969/announce
	enable-dht=true
	bt-enable-lpd=true
	enable-peer-exchange=true
EOF
fi

if [ -f "$aria2_session" ]; then
	echo "***** Loading aria2 session file *****"
else
	echo "***** Creating default aria2 session file *****"
	touch $aria2_session
fi

mkdir -p /app/aria2down
mkdir -p /app/logs

chmod -Rf 777 /web/
chmod -Rf 777 /app/

echo "***** Done *****"
exec "$@"