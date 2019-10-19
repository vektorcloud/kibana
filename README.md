# kibana

[![circleci][circleci]](https://circleci.com/gh/vektorcloud/kibana)

Alpine-based Kibana image

## Usage

```bash
docker run -d -e ES_HOST="10.0.0.2:9200" -p 5601:5601  quay.io/vektorcloud/kibana:latest
```

Where ES_HOST is the hostname/IP and port of the Elastic instance you wish to connect to

[circleci]: https://img.shields.io/circleci/build/gh/vektorcloud/kibana?color=1dd6c9&logo=CircleCI&logoColor=1dd6c9&style=for-the-badge "kibana"
