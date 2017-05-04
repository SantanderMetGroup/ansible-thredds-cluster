#!/bin/bash

CATALINA_HOME=$1
INSTANCE_HOME=$2

if [ ! -d "$INSTANCE_HOME" ]; then
  mkdir -p $INSTANCE_HOME
  mkdir -p $INSTANCE_HOME/temp
  mkdir -p $INSTANCE_HOME/work
  mkdir -p $INSTANCE_HOME/logs
  ln -s $CATALINA_HOME/bin $INSTANCE_HOME/bin
  cp -a $CATALINA_HOME/conf $INSTANCE_HOME/
  ln -s $CATALINA_HOME/lib $INSTANCE_HOME/lib
  ln -s $CATALINA_HOME/webapps $INSTANCE_HOME/webapps
  mkdir -p $INSTANCE_HOME/content/thredds
  mkdir -p $INSTANCE_HOME/content/thredds/cache
  mkdir -p $INSTANCE_HOME/content/thredds/logs
  mkdir -p $INSTANCE_HOME/content/thredds/gws
  ln -s $CATALINA_HOME/content/thredds/public $INSTANCE_HOME/content/thredds/public
#  ln -s $CATALINA_HOME/content/thredds/catalog.xml $INSTANCE_HOME/content/thredds/catalog.xml
#  ln -s $CATALINA_HOME/content/thredds/enhancedCatalog.xml $INSTANCE_HOME/content/thredds/enhancedCatalog.xml
  ln -s $CATALINA_HOME/content/thredds/threddsConfig.xml $INSTANCE_HOME/content/thredds/threddsConfig.xml
  ln -s $CATALINA_HOME/content/thredds/wmsConfig.xml $INSTANCE_HOME/content/thredds/wmsConfig.xml
  ln -s $CATALINA_HOME/content/thredds/wmsConfig.dtd $INSTANCE_HOME/content/thredds/wmsConfig.dtd
#  ln -s $CATALINA_HOME/content/thredds/catalogs $INSTANCE_HOME/content/thredds/catalogs
fi
