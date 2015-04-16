# loopnav.devenv

set up a dockerized development environment for loop nav. We will need the following components in separate docker containers: 

- mongo
- rabbitMQ
- node.js optional (otherwise use localhost) 

ideas from:

GIT: [https://github.com/relateiq/docker_public](https://github.com/relateiq/docker_public)

Blog: [http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-2-of-2/](http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-2-of-2/)

but we have a few differences: 
- we use boot2docker instead of vagrant
- we use docker-compose to simplify the container setup.

## How to use

just 
```
git clone
```
this repo, and do one of these commands: 

```
$ bin/devenv.sh up

$ bin/devenv.sh down

$ $(bin/devenv.sh shellinit)

```


