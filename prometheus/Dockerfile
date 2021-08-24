FROM ubuntu:focal

RUN mkdir -p /app/prometheus
WORKDIR /app

COPY ./files/prometheus-2.29.0-rc.0.linux-amd64.tar.gz .

ENV DEBIAN_FRONTEND=noninteractive

RUN tar -xf prometheus-2.29.0-rc.0.linux-amd64.tar.gz -C /app/prometheus --strip-components=1 && \
    rm -f prometheus-2.29.0-rc.0.linux-amd64.tar.gz

CMD ["prometheus/prometheus", "--config.file=prometheus/prometheus.yml", "--log.level=debug"]