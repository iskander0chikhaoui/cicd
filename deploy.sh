#!/bin/bash

function trap_ctrlc() {
	echo "Shutting down docker."
	docker-compose down
	echo "Stopped bash opeation."
	exit 2
}

trap "trap_ctrlc" 2

cd ./demo-rest-api &&
 mvn clean package docker:build -DskipTests &&
 cd .. &&
 #docker-compose build &&
 docker-compose up
