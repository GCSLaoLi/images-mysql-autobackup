#!/bin/bash
set -e
mkdir -p /backup/full
#在使用之前，请提前创建以下各个目录
#获取当前时间
date_now=$(date "+%Y%m%d-%H%M%S")
backUpFolder=/backup/full
logFile=/backup/bak.log
username="root"
password=$MYSQL_ROOT_PASSWORD
echo $password
db_name="all"
#定义备份文件名
fileName="${db_name}_${date_now}.sql"
#定义备份文件目录
backUpFileName="${backUpFolder}/${fileName}"
echo "starting backup mysql ${db_name} at ${date_now}."
/usr/bin/mysqldump -u${username} -p${password}  --lock-all-tables --flush-logs --all-databases > ${backUpFileName}
#进入到备份文件目录
cd ${backUpFolder}
#压缩备份文件
tar zcvf ${fileName}.tar.gz ${fileName}
#删除原始备份节约空间
rm -f ${fileName}

# use nodejs to upload backup file other place
#NODE_ENV=$backUpFolder@$backUpFileName node /home/tasks/upload.js
date_end=$(date "+%Y%m%d-%H%M%S")
echo `date +"%Y年%m月%d日 %H:%M:%S"`  "creat backup mysql database ${db_name} at ${fileName}." >> $logFile
echo "creat backup mysql database ${db_name} at ${date_end}." 
