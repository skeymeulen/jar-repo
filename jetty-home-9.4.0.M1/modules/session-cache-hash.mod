[description]
Enable first level session cache in ConcurrentHashMap.
If not enabled, sessions will use a HashSessionCache by default, so enabling
via this module is only needed if the configuration properties need to be
changed.

[provides]
session-cache

[depends]
sessions

[xml]
etc/sessions/hash-session-cache.xml

[ini-template]
#jetty.session.evictionPolicy=-1
#jetty.session.saveOnInactiveEvict=false
#jetty.session.removeUnloadableSessions=false
