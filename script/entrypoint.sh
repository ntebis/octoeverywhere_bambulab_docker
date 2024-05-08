#!#!/bin/bash

(echo ${ACCESS_CODE}; echo ${SERIAL_NUMBER}; echo "y" ; echo ${PRINTER_IP_ADDRESS}) |\
 ${OE_ENV}/bin/python3 -B -m py_installer ${PY_LAUNCH_JSON} || true


# Code taken from https://github.com/RyanEwen/octoeverywhere_bambu_docker/blob/main/scripts/container_setup.sh
 grep 'ExecStart=' /etc/systemd/system/octoeverywhere-bambu.service | \
 sed -r 's/ExecStart=//' > /root/start.sh && chmod +x /root/start.sh

 /root/start.sh