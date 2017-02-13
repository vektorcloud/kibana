FROM quay.io/vektorcloud/base:3.5

ENV KIBANA_VERSION 5.2.0

RUN apk add --no-cache nodejs openssl && \
    wget -q https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
    tar zxf kibana-${KIBANA_VERSION}-linux-x64.tar.gz && mv kibana-${KIBANA_VERSION}-linux-x64 /kibana && \
    rm /kibana/node/bin/node /kibana/node/bin/npm && \
    ln -s /usr/bin/node /kibana/node/bin/node && \
    ln -s /usr/bin/npm /kibana/node/bin/npm && \
    adduser -D kibana && chown -Rf kibana /kibana && \
    rm kibana-${KIBANA_VERSION}-linux-x64.tar.gz
  
COPY run.sh /run.sh

USER kibana 
EXPOSE 5601
CMD [ "/run.sh" ]
