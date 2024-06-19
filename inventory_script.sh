#!/bin/bash

OUTPUT_FILE="inventory_report.csv"

DELIMITER=","

get_hardware_info() {
  if [ "$OSTYPE" == "darwin" ]; then
    hwinfo=$(sysctl -n hw.model | tr -d '\n')
    cpu_info=$(sysctl -n hw.cpu | tr -d '\n')
    ram_info=$(sysctl -n hw.memsize | tr -d '\n')
    disk_info=$(diskutil info . | grep "Size (Total):" | cut -d ':' -f2-)
    network_info=$(networksetup -getinfo | grep "Ethernet" | cut -d ':' -f2-)
    graphics_info=$(system_profiler SPDisplaysDataType | grep "Graphics Card" | cut -d ':' -f2-)
  elif [ "$OSTYPE" == "winnt" ]; then
    hwinfo=$(wmic csproduct get name | tr -d '\n')
    cpu_info=$(wmic cpu get name | tr -d '\n')
    ram_info=$(wmic os get totalvisiblememorysize | tr -d '\n')
    disk_info=$(wmic diskdrive get size | tr -d '\n')
    network_info=$(wmic nic get name,description | tr -d '\n')
    graphics_info=$(wmic path win32_pnpsigneddriver get name,version | tr -d '\n')
  fi
}

get_software_info() {
  if [ "$OSTYPE" == "darwin" ]; then
    sw_info=$(sw_vers -productVersion | tr -d '\n')
    installed_apps=$(brew list --versions | tr -d '\n')
  elif [ "$OSTYPE" == "winnt" ]; then
    sw_info=$(wmic os get caption | tr -d '\n')
    installed_apps=$(wmic product get name,version | tr -d '\n')
  fi
}

get_user_info() {
  if [ "$OSTYPE" == "darwin" ]; then
    user_info=$(dscl . -list /users | tr -d '\n')
  elif [ "$OSTYPE" == "winnt" ]; then
    user_info=$(wmic useraccount get name,fullname | tr -d '\n')
  fi
}

main() {
  get_hardware_info

  get_software_info

  get_user_info

  echo "Hardware,Software,User" > $OUTPUT_FILE

  echo "$hwinfo,$cpu_info,$ram_info,$disk_info,$network_info,$graphics_info" >> $OUTPUT_FILE

  echo "$sw_info,$installed_apps" >> $OUTPUT_FILE

  echo "$user_info" >> $OUTPUT_FILE
}

main
