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
# run:    /opt/bin/kubecfg -h http://127.0.0.1:8080 -c redis-slave-controller.json create replicationControllers
#					/opt/bin/kubecfg -h http://127.0.0.1:8080 -c redis-slave-service.json create services
#
