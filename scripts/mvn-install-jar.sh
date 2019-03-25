#!/usr/bin/env bash

mvn install:install-file -Dfile=/Users/Zach/aray-bigdata/lib/ojdbc8-12.2.0.1.jar \
-DgroupId=com.oracle -DartifactId=ojdbc8 -Dversion=12.2.0.1 -Dpackaging=jar