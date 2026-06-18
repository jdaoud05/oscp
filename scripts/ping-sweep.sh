#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <subnet>"
  echo "Example: $0 10.10.10"
  exit 1
fi

subnet=$1

for i in $(seq 1 254); do
  ping -c 1 -W 1 "${subnet}.${i}" 2>/dev/null | grep "bytes from" &
done
wait
