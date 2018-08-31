#!/bin/bash

COMMAND="{{ stp_vpn_command }}"
HOST="{{ stp_host }}"
SLEEP_TIME="{{ stp_monitoring_vpn_refresh_time }}"

echo "Monitoring VPN"

while true
do
  if [[ "{$(${COMMAND} status)[0]}" == *"Disconnected"* ]]; then
      echo "Connecting..."
      printf '{{ stp_username }}\n{{ stp_password }}\n' | ${COMMAND} -s connect ${HOST}
  else
    echo "Connected."
  fi

  sleep ${SLEEP_TIME}
done
