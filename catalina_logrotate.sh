#!/bin/bash

APP_BASE="/opt/leedage/app"
LOGDIR="/opt/leedage/app/*/logs"
LOGNAME="catalina.out"

DATE=`date -d "-1 day" +%F`

archive() {
    for log in ${LOGDIR}
    do
        if [ -e ${log}/${DATE}_${LOGNAME} ];then
            cat ${log}/${LOGNAME} >> ${log}/${DATE}_${LOGNAME} && > ${log}/${LOGNAME}
        else
            scp ${log}/${LOGNAME} ${log}/${DATE}_${LOGNAME} && > ${log}/${LOGNAME}
        fi
    done
}
archive
