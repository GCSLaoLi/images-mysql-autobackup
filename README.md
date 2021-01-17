## 使用

dockerhub 拉取

```shell
docker pull gcslaoli/mysql8-autobackup:latest
```

阿里云拉取

```shell
docker pull registry.cn-beijing.aliyuncs.com/gcslaoli/mysql8-autobackup:latest
```

每分钟执行一次测试 可以通过容器日志查看

每小时执行一次 binlog 增量备份到`/backup/increment`

每天执行一次全量备份到`/backup/full`

备份脚本会记录一份日志到 `/bakcup/bak.log`

应对容器内 `/var/lib/mysql/` `/backup/`两个目录进行持久化挂载

`docker-compose.yml`示例

```yml
services:
  mysql8-autobackup:
    image: gcslaoli/mysql8-autobackup
    command: --default-authentication-plugin=mysql_native_password
    # restart: always
    volumes:
      - ./data/mysql/:/var/lib/mysql/
      - ./data/backup/:/backup/
      # - ./my.cnf:/etc/mysql/my.cnf
    environment:
      # TZ: Asia/Shanghai # 指定时区
      MYSQL_ROOT_PASSWORD: "12345678" # 配置root用户密码
    # ports:
    #   - 3306:3306
```

## 开发

执行 `sh build.sh`编译发布镜像
