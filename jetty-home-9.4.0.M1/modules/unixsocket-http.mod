[description]
Adds a HTTP protocol support to the Unix Domain Socket connector.
It should be used when a proxy is forwarding either HTTP or decrypted
HTTPS traffic to the connector and may be used with the 
unix-socket-http2c modules to upgrade to HTTP/2.

[depend]
unixsocket

[xml]
etc/jetty-unixsocket-http.xml



