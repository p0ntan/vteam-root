# vteam-root

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

## Setup
To clone this repo together with all the submodules, run the command:

```
git clone --recursive https://github.com/p0ntan/vteam-root.git

# For SSH
# git clone --recursive git@github.com:p0ntan/vteam-root.git
```

See the .env.example for needed .env-variables in your own .env to run the system locally. Some of the submodules needs their own .env file, but to make it easier for you the bashscript setup.bash will take care of it for you. When all variables in place just run:

```
./setup.bash env
```

### Development
You can then start the system in a development-mode, just run the command: 

```
./setup.bash dev

# Pro-tip, use the flag --env and to create the .env at the same time instead of in two commands.
# ./setup.bash dev -- env
```

This will start all the submodules in their own containers with all files added as volumes so you keep working with your local files in the editing software of your choice. You can also enter containers to run tests with the command:

```
docker exec -it <container-name> bash
```

The container for the bike-brain is a bit different, it will startup from the start but need to restart when any changes is made. To make it easier when developing, just run:
```
./setup.bash bike
```
Which will restart the container and then keep you inside it for starting files and whatever is needed.

### Production
Or if you feel that you've hade enough of all that development. You can then run the system in smaller more production-like containers with the command:

```
# Pro-tip, you can use the --env flag here aswell.
./setup.bash up
```

## Teardown
Just use the following command to stop the system, shut down the docker-network and remove all images and volumes that was built during setup.

```
./setup.bash down
```
