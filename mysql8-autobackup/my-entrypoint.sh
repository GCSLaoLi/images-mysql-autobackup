#!/bin/bash
set -e
echo "开始启动docker-cron"
DOCKERCRON=docker-cron-linux-amd64-v1.0.2
echo $*
cd /docker-cron/
env
chmod 777 ${DOCKERCRON}
./${DOCKERCRON} &
cd -
echo "docker-cron启动完成,继续执行原始启动命令!"
docker-entrypoint.sh $*