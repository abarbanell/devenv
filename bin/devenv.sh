#!/bin/sh

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
cd $SCRIPT_HOME/..

MODULES="mongo"

case "$1" in
       up)
               boot2docker up
							 for mod in $MODULES
							 do
								 $SCRIPT_HOME/devenv.${mod}.sh up
							 done
               ;;
			 down)
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
