#!/bin/bash

BIN_DIR=$(dirname $0)
DOLPHINSCHEDULER_HOME=${DOLPHINSCHEDULER_HOME:-$(cd $BIN_DIR/..; pwd)}

source "$BIN_DIR/dolphinscheduler_env.sh"

java $JAVA_OPTS \
  -cp "$DOLPHINSCHEDULER_HOME/conf":"$DOLPHINSCHEDULER_HOME/libs/*" \
  org.apache.dolphinscheduler.tools.datasource.CreateDolphinSchedulerv