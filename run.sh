#!/bin/bash

es_hostvars="ES_HOST ELASTIC_URI"

for var in $es_hostvars; do
  [ ! -z "${!var}" ] && {
    ES_HOST=${!var}
    echo "configuring elastic host from env var $var [$ES_HOST]"
    break
  }
done

[ -z "$ES_HOST" ] && {
  echo "elastic host must be defined in one of the following env vars: $es_hostvars"
  exit 1
}

[[ $ES_HOST =~ http://* ]] || ES_HOST=http://${ES_HOST}

echo "server.host: 0.0.0.0" >> /kibana/config/kibana.yml
echo "logging.quiet: false" >> /kibana/config/kibana.yml
echo "elasticsearch.url: \"${ES_HOST}\"" >> /kibana/config/kibana.yml

cd /kibana 
exec ./bin/kibana
