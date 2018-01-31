#!/bin/sh
# original script working with virtualbox, now switched to docker-for-mac with HyperKit VM
# status: not yet completely transformed
# with docker-for-mac we should not use docker-machine any more because it will point nowhere or to the wrong VM. 
# So most of this script actually got redundant. We'll keep it for a while but maybe we just eliminate it later.


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
		echo '--- please use docker-for-mac to create new machine '
		;;
	start)
		docker-compose down
		docker-compose up -d
		;;
stop)
		docker-compose stop
		;;
env)
		echo '--- please use docker commands (info or inspect) to get environment'
		;;
upgrade)
		git pull
		;;
*)
		echo usage: $0 "[create|start|stop|env|upgrade] - only start and stop do anything though"
		;;
esac
