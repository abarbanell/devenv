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
	create)
		docker-machine rm -f default
		docker-machine create -d virtualbox default
		docker-machine env default
		;;
	start)
		docker-machine start default
		eval "$(docker-machine env default)"
		docker-compose up -d
		;;
stop)
		eval "$(docker-machine env default)"
		docker-compose stop
		docker-machine stop default
		;;
env)
		docker-machine env default
		;;
upgrade)
		git pull
		docker-machine upgrade default
		docker-machine rm default
		docker-machine create -d virtualbox default
		;;
*)
		echo usage: $0 "[create|start|stop|env|upgrade]"
		;;
esac
