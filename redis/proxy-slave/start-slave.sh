#!/bin/bash
#
redis_master_porxy_ip=`cat /etc/hosts | grep redis_ambassador | awk '{print $1}'`

if [ -z $redis_master_porxy_ip ]; then    
    echo "redis_ambassador not defined in /etc/hosts Did you run with --link=redis_ambassador:redis_ambassador?";
    exit 7;
else
    echo "redis_ambassador's ip -> " $redis_master_porxy_ip
    exec /usr/local/bin/redis-server --slaveof $redis_master_porxy_ip 6379 
fi



