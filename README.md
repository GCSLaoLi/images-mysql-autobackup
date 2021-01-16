## 使用
每分钟执行一次测试 可以通过容器日志查看

每小时执行一次 binlog 增量备份到`/backup/increment`

每天执行一次全量备份到`/backup/full`

备份脚本会记录一份日志到 `/bakcup/bak.log`

应对容器内 `/var/lib/mysql/` `/backup/`两个目录进行持久化挂载


## 开发
执行 `sh build.sh`编译发布镜像
