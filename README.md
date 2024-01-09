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
See the .env.example for needed .env-variables to run the system locally. You also have to create .env-files for all the clients used in the system (admin/user/user), check what is needen in each of these repos. 

With all .env-files in place, run the repo with the following command to build all the docker-containers and start the system.

```
./setup.bash up
```

## Teardown
Just use the following command to stop the system, shut down the docker-network and remove all images that was built during setup.


```
./setup.bash down
```