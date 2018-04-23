FROM quay.io/vektorcloud/base:3.7

ENV KIBANA_VERSION 6.2.4
ENV KIBANA_FILENAME kibana-${KIBANA_VERSION}-linux-x86_64

RUN apk add --no-cache nodejs openssl bash && \
    wget https://artifacts.elastic.co/downloads/kibana/${KIBANA_FILENAME}.tar.gz && \
    tar zxf ${KIBANA_FILENAME}.tar.gz && mv ${KIBANA_FILENAME} /kibana && \
    rm /kibana/node/bin/node /kibana/node/bin/npm && \
    ln -s /usr/bin/node /kibana/node/bin/node && \
    ln -s /usr/bin/npm /kibana/node/bin/npm && \
    adduser -D kibana && chown -Rf kibana /kibana && \
    rm ${KIBANA_FILENAME}.tar.gz
  
COPY run.sh /run.sh

USER kibana 
EXPOSE 5601
CMD [ "/run.sh" ]
