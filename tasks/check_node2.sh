#!/bin/bash
ansible node2 -m shell -a "ps -ef | grep java && ss -ntl"
