# devenv - Docker setup for mongo and RabbitMQ

THis is a script to run our development environment for node, mondo etc on docker. 

## NEW - this version uses the docker for mac

Caveats: 

- I use Mac OS 10.11.6 - your mileage may vary.
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) is currently in public beta with version 1.12.0-rc4-beta20 (build 10404) and updated almost weekly. Whatever is in this repo may become outdated soon
- whatever is described in the README may not yet be fully implemented
- with the introduction of its new abstraction to the HyperKit VM managed by the MacOS docker command, this whole script boils down to mapping the _start_ and _stop_ operations to a singel line each of docker-compose commands. It is absolutely questionable whether the whole thing is still needed. Previously there had to be a variety of commands to be issued and this script saved a lot of time, but not any more.

### Install

- get [Docker for Mac](https://docs.docker.com/docker-for-mac/)
- get this repo with 

```
git clone https://github.com/abarbanell/devenv.git
```

- the first time you need to create SSL certificates for the nginx container.
 
```
$ cd devenv
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.conf/cert.key -out nginx.conf/cert.crt
```

### USe

Since the docker command runs its own HyperKit virtual machine there is actually nothing to start or stop here, you just need to make sure that the docker 
engine is running on your Mac. 

Then the containers listed in the file docker-compose.yml will be started and stopped with 

```
$ ./devenv.sh start
$ ./devenv.sh stop

# alternatively you could just use instead: 
$ docker-compose up -d
$ docker-compose stop
```

You see, nothing much left. I will leave this project hanging around for a while and see whather there is a need for this wrapper in the future for some reason.


## Old - obsolete README

*Note: this section of README uses the boot2docker tool on MacOS which is now deprecated. Working on an upgrade of this to docker-machine, already in progress on the code. so stay tuned for update of the README.*

This is a quick recipe how to set up a dockerized development environment 
(e.g. for one of my node.js projects
[abarbanell/loopnav](https://github.com/abarbanell/loopnav) ).  This
works for MacOS, but the ideas may be usable also elsewhere.  We
will need the following components in separate docker containers:

- mongo - as a data store
- rabbitMQ - used as message queue for background jobs
- nginx - as SSL reverse proxy to serve https traffic
- nodejs - a container running your node application, using nodemon

I took some ideas from:

GIT: [https://github.com/relateiq/docker_public](https://github.com/relateiq/docker_public)

Blog: [http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-2-of-2/](http://blog.relateiq.com/a-docker-dev-environment-in-24-hours-part-2-of-2/)

but in my setup there are  a few differences: 
- I use boot2docker instead of vagrant
- i use docker-compose to simplify the container setup.

## How to use

just

- install [boot2docker for MacOS](https://docs.docker.com/installation/mac/) 
- install [docker-compose](https://docs.docker.com/compose/install/)


then


```
git clone https://github.com/abarbanell/devenv.git
```

this repo, the first time you need to create SSL certificates for
the nginx container.

```
$ cd devenv
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.conf/cert.key -out nginx.conf/cert.crt
```

Note - if you use this name for your certificate then .gitignore
will make sure they do not get accidentally included in your git
repository.

You will need to answer a few   questions for the SSL certificate
signing request, but since we are not ging to use this for real
signed certificates it does not really matter what you enter here.

and do one of these commands: 

```
$ devenv.sh up
$ $(bin/devenv.sh shellinit)
$ docker ps
         Name                       Command               State                        Ports                       
------------------------------------------------------------------------------------------------------------------
devenv_mongo_1    /entrypoint.sh mongod            Up      0.0.0.0:27017->27017/tcp                         
devenv_rabbit_1   /docker-entrypoint.sh rabb ...   Up      0.0.0.0:15672->15672/tcp, 0.0.0.0:5672->5672/tcp 
<you should also see nginx and node here as soon as they are working :) >

$ devenv.sh down


```

## See also

Announcement on my
[blog](http://blog.abarbanell.de/linux/2015/06/10/devenv---docker-setup-for-mongo-and-rabbitmq/?utm_source=github&utm_medium=link&utm_campaign=d-2015-06-11)
from 10-Jun-2015.
