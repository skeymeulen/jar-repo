[description]
Enables the HTTP2C protocol on the HTTP Connector
The connector will accept both HTTP/1 and HTTP/2 connections.

[depend]
http

[lib]
lib/http2/*.jar

[xml]
etc/jetty-http2c.xml

[ini-template]
## Max number of concurrent streams per connection
# jetty.http2c.maxConcurrentStreams=1024

## Initial stream send (server to client) window
# jetty.http2c.initialStreamSendWindow=65535
