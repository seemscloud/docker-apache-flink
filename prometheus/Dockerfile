FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /app/prometheus
WORKDIR /app

RUN apt-get update && \
    apt-get install wget -y && \
    wget https://github.com/prometheus/prometheus/releases/download/v2.29.1/prometheus-2.29.1.linux-amd64.tar.gz && \
    tar -xf prometheus-2.29.1.linux-amd64.tar.gz -C /app/prometheus --strip-components=1 && \
    rm -f prometheus-2.29.1.linux-amd64.tar.gz

CMD ["prometheus/prometheus", "--config.file=prometheus/prometheus.yml", "--log.level=debug"]