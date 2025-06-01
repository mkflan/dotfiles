#!/bin/bash

BATTERY=$(acpi -b | grep -E -o '[0-9][0-9]?%')

# Only print the battery number if the command output starts with a number.
# On desktop, it won't start with a number as acpi is unable to find the
# battery for a power supply.
if [[ $BATTERY =~ ^[0-9]+$ ]]; then
  echo "󰁹 $BAT"
fi

exit 0
