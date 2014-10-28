FROM redis:latest
EXPOSE 6379
VOLUME ["/data"]

# RUN sysctl vm.overcommit_memory=1


ADD start-slave.sh /src/start-slave.sh 

WORKDIR /src

RUN cd /src

# ENTRYPOINT ["./start-slave.sh", "--dir", "/data"]

CMD ["./start-slave.sh"]

#
# build:  docker build -t yuanxiaolong/redis-slave .
# run:    docker run -d -P --name=redis_slave --link=redis-master:redis_master yuanxiaolong/redis-slave 
#
