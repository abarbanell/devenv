#!/bin/sh

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
echo SCRIPT_HOME: $SCRIPT_HOME
cd $SCRIPT_HOME

if [ -e node/src ] 
then
	echo "src dir for node container exists"
else
	ln -s node/src.template node/src
	echo "linked template project into node container" 
fi

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
