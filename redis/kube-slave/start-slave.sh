#!/bin/bash
#
# exec allows redis-server to receive signals for clean shutdown
#

echo "SERVICE_HOST -> " $SERVICE_HOST
echo "REDISMASTER_SERVICE_PORT -> " $REDISMASTER_SERVICE_PORT

exec /usr/local/bin/redis-server --slaveof $SERVICE_HOST $REDISMASTER_SERVICE_PORT 
