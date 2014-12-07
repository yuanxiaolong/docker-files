FROM redis:2.8.17
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
# before to run master: docker run --name redis-master -v /root/app/workspace/redis/data:/data -d --expose 6379 redis redis-server --appendonly yes
# before to run proxy: docker run -d -v /var/run/docker.sock:/var/run/docker.sock  --name redis_ambassador  cpuguy83/docker-grand-ambassador -name redis-master
# run:    docker run -d -P --name=redis_slave --link=redis_ambassador:redis_ambassador yuanxiaolong/redis-slave 
#
