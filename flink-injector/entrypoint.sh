#!/bin/bash

while true; do
  timeout 5 bash -c "</dev/tcp/${FLINK_JM_ADDRESS}/8081" && break
  sleep 1
done

FLINK_STREAMING_EXAMPLES="/opt/flink/examples/streaming"

for i in $(seq 1 ${FAKE_JOB_PACK_COUNT}); do
  printf "%100s\n" | tr " " "="
  echo -e "Injecting job number: ${i}\n"

  flink run --detached --jobmanager flink-jm:8081 "${FLINK_STREAMING_EXAMPLES}/WindowJoin.jar" --parallelism 10
  flink run --detached --jobmanager flink-jm:8081 "${FLINK_STREAMING_EXAMPLES}/TopSpeedWindowing.jar" --parallelism 10
  flink run --detached --jobmanager flink-jm:8081 "${FLINK_STREAMING_EXAMPLES}/StateMachineExample.jar" --parallelism 10
done
