[description]
Provides the logback core implementation, used by slf4j-logback
and logback-access

[files]
maven://ch.qos.logback/logback-core/${logback.version}|lib/logback/logback-core-${logback.version}.jar

[lib]
lib/logback/logback-core-${logback.version}.jar

[license]
Logback: the reliable, generic, fast and flexible logging framework.
Copyright (C) 1999-2012, QOS.ch. All rights reserved. 

This program and the accompanying materials are dual-licensed under
either:

    the terms of the Eclipse Public License v1.0 
    as published by the Eclipse Foundation: 
    http://www.eclipse.org/legal/epl-v10.html
 
or (per the licensee's choosing) under
    
    the terms of the GNU Lesser General Public License version 2.1
    as published by the Free Software Foundation: 
    http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html

[ini]
logback.version=1.1.7

[ini-template]
## After changing versions, run 'java -jar $JETTY_HOME/start.jar --create-files' 
#logback.version=1.1.7
