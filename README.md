# devenv - Docker setup for mongo and RabbitMQ

This is a script to run our development environment for nginx, mongo etc on docker. 

## NEW - this version uses the docker for mac

Caveats: 

- I use Mac OS 10.11.6 - your mileage may vary.
- [Docker for Mac](https://docs.docker.com/docker-for-mac/) is currently in public beta with version 1.12.0-rc4-beta20 (build 10404) and updated almost weekly. Whatever is in this repo may become outdated soon
- with the introduction of its new abstraction to the HyperKit VM
managed by the MacOS docker command, this whole script boils down
to mapping the _start_ and _stop_ operations to a single line each
of docker-compose commands. It is absolutely questionable whether
the whole thing is still needed. Previously there had to be a variety
of commands to be issued and this script saved a lot of time, but
not any more.

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

### Use

Since the docker command runs its own HyperKit virtual machine there is actually no VM to start or stop here, you just need to make sure that the docker 
engine is running on your Mac.

Then the containers listed in the file docker-compose.yml will be started and stopped with 

```
$ ./devenv.sh start
$ ./devenv.sh stop

# alternatively you could just use instead: 
$ docker-compose up -d
$ docker-compose stop
```

You see, nothing much. I will leave this project hanging around for a while and see whather there is a need for this wrapper in the future for some reason.


