#!/bin/bash
#
if [ -z "$REDIS_MASTER_PORT_6379_TCP_ADDR" ]; then
    echo "REDIS_MASTER_PORT_6379_TCP_ADDR not defined. Did you run with -link?";
    exit 7;
fi
# exec allows redis-server to receive signals for clean shutdown
#

echo "SERVICE_HOST -> " $SERVICE_HOST
echo "REDISMASTER_SERVICE_PORT -> " $REDISMASTER_SERVICE_PORT

exec /usr/local/bin/redis-server --slaveof $SERVICE_HOST $REDISMASTER_SERVICE_PORT 
