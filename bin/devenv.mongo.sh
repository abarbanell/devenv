#!/bin/sh
   
case "$1" in
	up)
		docker rm -f mongo-dev
		MONGO=$(docker run --name mongo-dev -d -p 27017:27017 mongo)
		echo mongo is running in container $MONGO
		;;
	down)
		echo remove mongo-dev container if exists
		docker rm -f mongo-dev
		;;
	*)
		echo usage: $0 "[up|down]"
		;;
esac
