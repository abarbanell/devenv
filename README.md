# devenv - Docker setup for mongo and RabbitMQ

This is a quick recipe how to set up a dockerized development environment 
(e.g. for one of my node.js projects
[abarbanell/loopnav](https://github.com/abarbanell/loopnav) ).  This
works for MacOS, but the ideas may be usable also elsewhere.  We
will need the following components in separate docker containers:

- mongo - as a data store
- rabbitMQ - used as message queue for background jobs
- nginx - as SSL reverse proxy to serve https traffic

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

$ devenv.sh down


```

## See also

Announcement on my
[blog](http://blog.abarbanell.de/linux/2015/06/10/devenv---docker-setup-for-mongo-and-rabbitmq/?utm_source=github&utm_medium=link&utm_campaign=d-2015-06-11)
from 10-Jun-2015.
