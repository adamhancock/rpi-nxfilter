#!/bin/bash

if [ ! -f "/nxfilter/conf/cfg.default" ]; then
  cp -a /nxfilter/conf-default/. /nxfilter/conf/
      echo "listen_ip = 0.0.0.0" >> /nxfilter/conf/cfg.properties
      echo "http_port = 80" >> /nxfilter/conf/cfg.properties
      echo "https_port = 443" >> /nxfilter/conf/cfg.properties
      echo "start_tomcat = 1" >> /nxfilter/conf/cfg.properties
      echo "cluster_mode = 0" >> /nxfilter/conf/cfg.properties
      echo "master_ip =" >> /nxfilter/conf/cfg.properties
      echo "slave_ip =" >> /nxfilter/conf/cfg.properties
      echo "blacklist_type = 5" >> /nxfilter/conf/cfg.properties
      echo "use_local_jahaslist = 1" >> /nxfilter/conf/cfg.properties
      echo "www_dir = guipack/sandwatch" >> /nxfilter/conf/cfg.properties
fi
exec "$@"
