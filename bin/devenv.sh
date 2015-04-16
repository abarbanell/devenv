#!/bin/sh

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
cd $SCRIPT_HOME/..

case "$1" in
	up)
		boot2docker up
		docker-compose up -d
		;;
down)
		docker-compose stop
		boot2docker down
		;;
shellinit)
		boot2docker shellinit
		;;
update)
		git pull
		;;
*)
		echo usage: $0 "[up|dhellinit|update]"
		;;
esac
