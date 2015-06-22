#!/bin/sh

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
echo SCRIPT_HOME: $SCRIPT_HOME

cd $SCRIPT_HOME/node
if [ -e src ] 
then
	echo "src dir for node container exists"
else
	if [ -h src ]
	then
		echo "src dir exists as symbolic link"
	else
		ln -s src.template src
		echo "linked template project into node container" 
	fi
fi

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
		boot2docker upgrade
		boot2docker delete
		boot2docker init
		;;
*)
		echo usage: $0 "[up|down|shellinit|update]"
		;;
esac
