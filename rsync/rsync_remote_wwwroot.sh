#!/bin/bash

wwwroot_appdownload=/data/ansible/leedage/update/wwwroot/appdownload
wwwroot_apph5=/data/ansible/leedage/update/wwwroot/apph5
wwwroot_leedage=/data/ansible/leedage/update/wwwroot/leedage
wwwroot_merchant=/data/ansible/leedage/update/wwwroot/merchant
wwwroot_system=/data/ansible/leedage/update/wwwroot/system
wwwroot_upgrade=/data/ansible/leedage/update/wwwroot/upgrade
wwwroot_approot=/data/ansible/leedage/update/wwwroot/approot
wwwroot_mall=/data/ansible/leedage/update/wwwroot/mall
#remote_host=$2

mall() {
        wwwroot_mall=/data/ansible/leedage/update/wwwroot/mall
        remote_host=172.26.3.82
        wwwroot=/opt/wwwroot/leedage/mall/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/*"
        rsync -avrzP ${wwwroot_mall}/ ${remote_host}:${wwwroot}/
    }

approot() {
        wwwroot_approot=/data/ansible/leedage/update/wwwroot/approot
        remote_host=172.26.3.85
        wwwroot=/opt/wwwroot/leedage/approot/html/download
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/*"
        rsync -avrzP ${wwwroot_approot}/ ${remote_host}:${wwwroot}/
    }


upgrade() {
        wwwroot_upgrade=/data/ansible/leedage/update/wwwroot/upgrade
        remote_host=172.26.3.85
        wwwroot=/opt/wwwroot/leedage/upgrade/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/{static,index.html}"
        rsync -avrzP ${wwwroot_upgrade}/ ${remote_host}:${wwwroot}/
    }

appdownload() {
        wwwroot_appdownload=/data/ansible/leedage/update/wwwroot/appdownload
        remote_host=172.26.3.81
        wwwroot=/opt/wwwroot/leedage/proroot/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/{static,index.html}"
        rsync -avrzP ${wwwroot_appdownload}/ ${remote_host}:${wwwroot}/
    }

apph5() {
        wwwroot_apph5=/data/ansible/leedage/update/wwwroot/apph5
        remote_host=172.26.3.81
        wwwroot=/opt/wwwroot/leedage/apph5/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/{static,index.html}"
        rsync -avrzP ${wwwroot_apph5}/ ${remote_host}:${wwwroot}/
    }

leedage() {
        wwwroot_leedage=/data/ansible/leedage/update/wwwroot/leedage
        remote_host=172.26.3.81
        wwwroot=/opt/wwwroot/leedage/leedage/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/{static,index.html}"
        rsync -avrzP ${wwwroot_leedage}/ ${remote_host}:${wwwroot}/
    }

merchant() {
        wwwroot_merchant=/data/ansible/leedage/update/wwwroot/merchant
        remote_host=172.26.3.82
        wwwroot=/opt/wwwroot/leedage/merchant/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/*"
        rsync -avrzP ${wwwroot_merchant}/ ${remote_host}:${wwwroot}/
    }

system() {
        wwwroot_system=/data/ansible/leedage/update/wwwroot/system
        remote_host=172.26.3.84
        wwwroot=/opt/wwwroot/leedage/system/html
        ssh ${remote_host} "rsync -arz --delete ${wwwroot}/ ${wwwroot}_bak/"
        ssh ${remote_host} "rm -rf ${wwwroot}/*"
        rsync -avrzP ${wwwroot_system}/ ${remote_host}:${wwwroot}/
    }

case $1 in
    appdownload)
        appdownload
    ;;
    apph5)
        apph5
    ;;
    leedage)
        leedage
    ;;
    merchant)
        merchant
    ;;
    system)
        system
    ;;
    upgrade)
        upgrade
    ;;
    approot)
        approot
    ;;
    mall)
        mall
    ;;
    *)
        echo "Usage: `basename $0` [appdownload|apph5|leedage|merchant|system|upgrade|approot|mall] [remote_host]"
    ;;
esac
