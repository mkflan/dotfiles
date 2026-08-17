#!/bin/bash

dte() {
  dte="$(date "%A, %B %d, %Y %H:%M %p")"
  echo -e "$dte"
}

while :; do
  echo "$(dte)"
  sleep 5
done
