#!/bin/sh

root_dir=$(dirname $0)

export CLASSPATH=$root_dir/lib/derbynet.jar

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

$java_path -Dij.user=sa -Dij.password=sapwd -Dij.connection.zzz="jdbc:derby:sewadb;create=true" org.apache.derby.tools.ij init.sql
