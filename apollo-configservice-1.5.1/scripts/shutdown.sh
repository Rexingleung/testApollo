#!/bin/bash
SERVICE_NAME=apollo-configservice

if [[ -z "$JAVA_HOME" && -d /usr/java/latest/ ]]; then
    export JAVA_HOME=/usr/java/latest/
fi

cd `dirname $0`/..

if [[ ! -f $SERVICE_NAME".jar" && -d current ]]; then
    cd current
fi

if [[ -f $SERVICE_NAME".jar" ]]; then
  chmod a+x $SERVICE_NAME".jar"
  ./$SERVICE_NAME".jar" stop
fi
export JAVA_OPTS="-server -Xms6144m -Xmx6144m -Xss256k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=384m -XX:NewSize=4096m -XX:MaxNewSize=4096m -XX:SurvivorRatio=18"