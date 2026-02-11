#!/bin/sh

root_dir=$(dirname $0)

export CLASSPATH=$root_dir/lib/derby.jar:$root_dir/lib/derbynet.jar

if [ "x$JAVA_HOME" != "x" ]; then
    java_path=$JAVA_HOME/bin/java
else
    java_path=`which java 2>/dev/null`
fi

if [ "x$1" = "xdebug" ]; then
    echo java_path=$java_path
    $java_path -version
    echo ""
fi

# ** Lance derby sur le port 1527 **
$java_path -Dderby.system.home=$root_dir -Duser.language=en org.apache.derby.drda.NetworkServerControl start -h 0.0.0.0 -p 1527 -noSecurityManager

# driver class=org.apache.derby.jdbc.ClientDriver
# driver jar=derbyclient.jar
# URL de connexion : jdbc:derby://localhost:1527/sewadb
# login="sa", password="sapwd"
