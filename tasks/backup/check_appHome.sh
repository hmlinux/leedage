#!/bin/bash
ansible leedage_app -m shell -a "hostname && ls -ld /opt/leedage/app/*/webapps/*"
