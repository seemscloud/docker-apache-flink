FROM grafana/grafana:8.1.0

USER root

RUN sed "s/;provisioning = conf\/provisioning/provisioning = conf\/provisioning/g" -i /etc/grafana/grafana.ini

USER grafana