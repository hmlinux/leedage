#!/bin/bash

NGINX_BASE=/opt/nginx
LOGDIR=/opt/nginx/logs

LOGFILES="m.leedage.com.log,static.leedage.com.log,brother0.leedage.com.log,pro.leedage.com.log,cashapi.leedage.com.log,error.log"

DATE=`date -d "-1 day" +%F`

archive() {
    OLD_IFS="$IFS"
    IFS=","
    cd $LOGDIR
    for log in ${LOGFILES}
    do
        if [ -e ${DATE}_${log} ];then
            cat ${log} >> ${DATE}_${log} && echo "" > ${log}
        else
            scp -r ${log} ${DATE}_${log} && echo "" > ${log}
        fi
    done
    IFS="$OLD_IFS"
}
archive
