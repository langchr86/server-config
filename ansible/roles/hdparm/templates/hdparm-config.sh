#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root"
  exit 1
fi

{% for device in hdparm_devices %}
hdparm -B {{ hdparm_apm_level|default('64') }} -S {{ hdparm_spindown_time|default('243') }} {{ device }}
{% endfor %}
