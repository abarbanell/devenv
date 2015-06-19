#!/bin/sh

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
echo SCRIPT_HOME: $SCRIPT_HOME
cd $SCRIPT_HOME

case "$1" in
	up)
		boot2docker up
		$(boot2docker shellinit)
		docker-compose up -d
		;;
down)
		$(boot2docker shellinit)
		docker-compose stop
		boot2docker down
		;;
shellinit)
		$(boot2docker shellinit)
		boot2docker shellinit
		;;
update)
		git pull
		;;
*)
		echo usage: $0 "[up|dhellinit|update]"
		;;
esac
