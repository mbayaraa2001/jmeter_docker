#!/bin/bash
#
SLAVE_IP=$(docker inspect -f '{{.Name}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) | grep slave | awk -F' ' '{print $2}' | tr '\n' ',' | sed 's/.$//')
eval "docker exec -it -d jmeterdocker-slave-1 /bin/bash -c '/jmeter/bin/jmeter-server -Djava.rmi.server.hostname=$SLAVE_IP'"


mkdir $NAME && 