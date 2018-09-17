#!/bin/bash

user="root"
passwd="ddkj_#20180514"
host="172.26.3.83"
port="3306"

basedir=/opt/mysql
datadir=/data/mysql/mysql
mysql_sock=/data/mysql/mysql.sock

bak_dir=/opt/db_backup
[ -d $bak_dir ] || mkdir -p $bak_dir

logfile=${bak_dir}/mysql_backup.log

options="-u$user -p$passwd -h$host -P$port"

lock() {
    mysql $options 2>/dev/null -e "FLUSH TABLES WITH READ LOCK;system sleep 36000;"
}

backup() {
    date=$(date "+%Y%m%d%H%M%S")
    current_dir=${date}
    archive=${current_dir}.tar.gz
    databases=`${basedir}/bin/mysql $options 2>/dev/null -e "show databases;" | sed -e '1d' -e '/_schema/d' -e '/mysql/d' -e '/Database/d' -e '/test/d' -e '/sys/d'`

    mkdir ${bak_dir}/${current_dir}
    cp /etc/my.cnf ${bak_dir}/${current_dir}/
    for d in $databases
    do
       ${basedir}/bin/mysqldump $options 2>/dev/null ${d} --triggers --events --routines > ${bak_dir}/${current_dir}/${d}.sql
    done
    cd ${bak_dir} && tar -zcvf ${archive} ${current_dir} && rm -rf ${current_dir}
}

main() {
    echo -e "-----Running backup-----\t`date "+%F %T"`" >> $logfile
    backup >> $logfile
    echo "finish." >> $logfile
}
main
