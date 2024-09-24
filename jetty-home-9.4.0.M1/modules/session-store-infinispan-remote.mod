[description]
Enables session data store in a remote Infinispan cache

[provides]
session-store

[depend]
sessions
sessions/infinispan/remote

[files]
maven://org.infinispan/infinispan-remote/7.1.1.Final|lib/infinispan/infinispan-remote-7.1.1.Final.jar

[lib]
lib/jetty-infinispan-${jetty.version}.jar
lib/infinispan/*.jar

[license]
Infinispan is an open source project hosted on Github and released under the Apache 2.0 license.
http://infinispan.org/
http://www.apache.org/licenses/LICENSE-2.0.html


[ini-template]
#jetty.session.remoteInfinispanCache.name=sessions
#jetty.session.infinispanIdleTimeout.seconds=0
#jetty.session.gracePeriod.seconds=3600
