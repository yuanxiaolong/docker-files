redis
============

这里面包含了大部分构建redis的配置

> ## slave dir

```
Usage:

#
# build:  docker build -t yuanxiaolong/redis-slave .
# run:    docker run -d -P --name=redis_slave --link=redis-master:redis_master yuanxiaolong/redis-slave
#
```

> ## proxy-slave

利用代理模式，让 proxy instead of master ，then slave link to proxy 。这样就构成了 master-slave sync

```master``` -> ```proxy``` -> ```slave```

```
Usage:

#
# build:  docker build -t yuanxiaolong/redis-slave .
# before to run master: docker run --name redis-master -v /root/app/workspace/redis/data:/data -d --expose 6379 redis redis-server --appendonly yes
# before to run proxy: docker run -d -v /var/run/docker.sock:/var/run/docker.sock  --name redis_ambassador  cpuguy83/docker-grand-ambassador -name redis-master
# run:    docker run -d -P --name=redis_slave --link=redis_ambassador:redis_ambassador yuanxiaolong/redis-slave
#
```

> ## kube-master

> 利用 ```kubernetes``` 构建 ```redis master``` 服务.

1.```redis-master.json``` 是一个简单的 ```pod``` 文件，它 lanuch 一个 ```pod``` 在任意一个 ```minions```

```
Usage（In kubenetes Master）:

#
# /opt/bin/kubecfg -c redis-master.json create pods
#

```
构建成功后，可以用 ```/opt/bin/kubecfg list pods``` 来检测 如果 STATUS 是 ```RUNNING``` 状态代表运行成功

2.```redis-master-controller.json``` 是一个 ```replicationControllers``` 它更灵活 可以轻松实现 ```HA``` ，也是推荐的做法。当它启动后，会生成 ```pod```

```
Usage（In kubenetes Master）:

#
# /opt/bin/kubecfg -c redis-slave-controller.json create replicationControllers
#

```

3.```redis-master-service.json```用于路由访问请求到其代理的 ```pod```

```
Usage（In kubenetes Master）:

#
# /opt/bin/kubecfg -c redis-master-service.json create services
#
```

> ## kube-slave

> 利用 ```kubernetes``` 构建 ```redis slave``` 服务.

同 kube-master dir，不过在运行之前，需要用到 ```yuanxiaolong/redis-slave``` 镜像，这个你可以从
```kube-slave/Dockerfile```里 ```build```出来
