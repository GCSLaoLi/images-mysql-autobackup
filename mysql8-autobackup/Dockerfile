FROM mysql:8
ENV TZ=Asia/Shanghai
ENTRYPOINT [ "my-entrypoint.sh" ]
VOLUME [ "/backup" ]
COPY my-entrypoint.sh /usr/local/bin/my-entrypoint.sh
COPY ./docker-cron/ /docker-cron/
