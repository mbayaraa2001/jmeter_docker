#!/bin/bash

COUNT=${1-1}

docker build -t jmeter-base jmeter-base
docker-compose build
docker-compose up -d
docker-compose scale master=1 slave=$COUNT
