#!/bin/bash
#extracts jmeter Slave container IP address
SLAVE_IP=$(docker inspect -f '{{.Name}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) | grep slave | awk -F' ' '{print $2}' | tr '\n' ',' | sed 's/.$//')

WDIR=`docker exec -it master /bin/pwd | tr -d '\r'`
for filename in scripts/*.jmx; do
    NAME=$(basename $filename)
    NAME="${NAME%.*}"
    eval "docker cp $filename master:$WDIR/scripts/"
    eval "docker exec -it -d jmeterdocker-slave-1 /bin/bash -c '/jmeter/bin/jmeter-server -Djava.rmi.server.hostname=$SLAVE_IP'"
    eval "docker exec -it master /bin/bash -c '/jmeter/bin/jmeter -n -t /jmeter/$filename -l /results/$NAME.jtl -R$SLAVE_IP'"
#    eval "docker exec -it master /bin/bash -c 'mkdir $NAME && cd $NAME && ../bin/jmeter -n -t ../$filename -R$SLAVE_IP'"
    eval "docker cp master:$WDIR/$NAME results/"
done
