#!/bin/bash
ansible node1 -m shell -a "ps -ef | grep java && ss -ntl"
