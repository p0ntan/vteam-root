# vteam-root

<p align="center">
<img src="./scooter-round.png" alt="Picture of an electric scooter." width="400">
</p>

This repo is for the course vteam at BTH, made by group vteam-2. The repo contains serveral submodules that together builds a complete system to for renting and managing electric scooters/bikes.

## Submodules

### server

[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/JuliaLind/vteam-server/badges/quality-score.png?b=main)](https://scrutinizer-ci.com/g/JuliaLind/vteam-server/?branch=main)
[![Code Coverage](https://scrutinizer-ci.com/g/JuliaLind/vteam-server/badges/coverage.png?b=main)](https://scrutinizer-ci.com/g/JuliaLind/vteam-server/?branch=main)
[![Build Status](https://scrutinizer-ci.com/g/JuliaLind/vteam-server/badges/build.png?b=main)](https://scrutinizer-ci.com/g/JuliaLind/vteam-server/build-status/main)

This submodule contains all the code for the server and database. [Link to repo](https://github.com/JuliaLind/vteam-server)

### bike-brain

[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/p0ntan/vteam-bike-brain/badges/quality-score.png?b=main)](https://scrutinizer-ci.com/g/p0ntan/vteam-bike-brain/?branch=main)
[![Build Status](https://scrutinizer-ci.com/g/p0ntan/vteam-bike-brain/badges/build.png?b=main)](https://scrutinizer-ci.com/g/p0ntan/vteam-bike-brain/build-status/main)
[![codecov](https://codecov.io/gh/p0ntan/vteam-bike-brain/graph/badge.svg?token=PQLIP59BOW)](https://codecov.io/gh/p0ntan/vteam-bike-brain)
[![linting: pylint](https://img.shields.io/badge/linting-pylint-yellowgreen)](https://github.com/pylint-dev/pylint)

This submodule contains all the code for each bike, and can also be used to simulate multiple bikes using the system. [Link to repo](https://github.com/p0ntan/vteam-bike-brain)

### admin-web-client

This submodule contains all the code for the admin interface. [Link to repo](https://github.com/kiwijos/admin-web-client)

### user-web-client

This submodule contains all the code for website used by users. [Link to repo](https://github.com/kiwijos/user-web-client)

### user-app-client

This submodule contains all the code for app used by users. [Link to repo](https://github.com/kiwijos/user-app)

## Setup
To clone this repo together with all the submodules, run the command:

```
git clone --recursive https://github.com/p0ntan/vteam-root.git

# For SSH
# git clone --recursive git@github.com:p0ntan/vteam-root.git
```

See the .env.example for needed .env-variables in your own .env to run the system locally.

### Development
Once all .env-variables is in place you can then start the system in a development-mode, just run the command: 

```
./setup.bash dev
```
This will start all the submodules in their own containers with all files added as volumes so you keep working with your local files in the editing software of your choice. If you want you can skip the admin/user-clients if they feel too slow in containers (or any other reason), and add the flag --local-clients:

```
./setup.bash dev --local-clients
```

This will start all services except the admin-web, user-web and user-app clients. You will then need to add some .env-files to those repos and run them locally, and you can read more about it in their own README.

With the system up and running you can then enter containers to run tests with the command:

```
docker exec -it <container-name> bash
```

The container for the bike-brain is a bit different, you can still enter it with the command above but it needs to be restarted when any changes is made. To make it easier when developing, just run:
```
./setup.bash bike
```

Which will restart the container and then keep you inside so you can execute the files and whatever you want.

### Production
Or if you feel that you've hade enough of all that development. You can then run the system in smaller more production-like containers. For this some of the submodules needs needs their own .env file (see admin/user/user-app repos for more detail), but to make it easier the bashscript setup.bash will take care of it for you. There are two ways to set up all .env files, either by two commands:

```
# Set up .env-files
./setup.bash env

# Start system
./setup.bash prod
```

Or with one single command where you can just add the flag --env to the prod-command:

```
# Sets up .env-files and starts the system
./setup.bash prod --env
```

## Clients
No matter how you run the system, our guess is that you want to see some of the clients in action? Well here are some links to find what you might be looking for:

- [Admin web client](http://localhost:3000)
- [User web client](http://localhost:5173)
- [User app](http://localhost:5174)

## REST-APU
Locally the REST-API can be reached here:

- [REST-API](http://localhost:1337/v1)
- [DOCS](http://localhost:1337/v1/docs)

## Teardown
Just use the following command to stop the system, shut down the docker-network and remove all images and volumes that was built during setup.

```
./setup.bash down
```
