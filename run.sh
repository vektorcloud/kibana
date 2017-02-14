#!/bin/sh

echo "server.host: 0.0.0.0" >> /kibana/config/kibana.yml

[ ! -z "$ES_HOST" ] && {
  echo "elasticsearch.url: \"http://${ES_HOST}\"" >> /kibana/config/kibana.yml
}

cd /kibana 
exec ./bin/kibana
