#!/bin/bash

CATALINA_HOME=$1
CATALINA_BASE=$2

if [ ! -d "$CATALINA_BASE" ]; then
  mkdir -p $CATALINA_BASE
  mkdir -p $CATALINA_BASE/temp
  mkdir -p $CATALINA_BASE/work
  mkdir -p $CATALINA_BASE/logs
  ln -s $CATALINA_HOME/bin $CATALINA_BASE/bin
  cp -a $CATALINA_HOME/conf $CATALINA_BASE/
  ln -s $CATALINA_HOME/lib $CATALINA_BASE/lib
  ln -s $CATALINA_HOME/webapps $CATALINA_BASE/webapps
  mkdir -p $CATALINA_BASE/content/thredds
  mkdir -p $CATALINA_BASE/content/thredds/cache
  mkdir -p $CATALINA_BASE/content/thredds/logs
  mkdir -p $CATALINA_BASE/content/thredds/gws
  ln -s $CATALINA_HOME/content/thredds/public $CATALINA_BASE/content/thredds/public
  ln -s $CATALINA_HOME/content/thredds/threddsConfig.xml $CATALINA_BASE/content/thredds/threddsConfig.xml
  ln -s $CATALINA_HOME/content/thredds/wmsConfig.xml $CATALINA_BASE/content/thredds/wmsConfig.xml
  ln -s $CATALINA_HOME/content/thredds/wmsConfig.dtd $CATALINA_BASE/content/thredds/wmsConfig.dtd
fi
