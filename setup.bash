#!/usr/bin/env bash
#
# Bash script for setting up the system
#
# Exit values:
#  0 on success
#  1 on failure
#

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="1.0.0"

# GLOBAL .env path
ORIGINAL_ENV="$(pwd)/.env"
ENV_CONTENT=$(cat "$ORIGINAL_ENV")

#
# Message to display for usage and help.
#
function usage
{
    local txt=(
""
"Script $SCRIPT is used for easy setup for system."
"Usage: $SCRIPT [options] <command> [arguments]"
""
"Commands:"
""
"   dev                  Start the system in a development containers."
"   bike                 Restarts the bike-container and enters it for easier development." 
"   env                  Creating all needed .env files."
"   prod                 Start the system in smaller production-like containers."
"      --env             Use flag --env for setting up the .env files."
""
"   down                 Shut down the system and remove images and volumes."
""
""
"Options:"
""
"   -h, --help      Display the menu"
"   -v, --version   Display the current version"
""
    )

    printf "%s\\n" "${txt[@]}"
}


#
# Message to display when bad usage.
#
function badUsage
{
    local message="$1"
    local txt=(
"For an overview of the command, execute:"
"$SCRIPT -h, --help"
    )

    [[ -n $message ]] && printf "%s\\n" "$message"

    printf "%s\\n" "${txt[@]}"
}


#
# Message to display for version.
#
function version
{
    local txt=(
"$SCRIPT version $VERSION"
    )

    printf "%s\\n" "${txt[@]}"
}

#
# Function to start the system as close to production as possible
#
function app-prod
{
    if [ "$1" == "--env" ]; then
        app-env
    fi

    # Start the system
    docker-compose up -d --build
}

#
# Function to start the container
#
function app-dev
{
    # Start the system
    docker-compose -f docker-compose.dev.yml up -d --build
}


#
# Function to set up the .env files
#
function app-env
{
    aw_files
    uw_files
    ua_files
    echo ".env-files created"
}


#
# Function to work with the bike-brain
#
function app-bike
{
    docker stop bike-python
    docker-compose -f docker-compose.dev.yml run python bash
}


#
# Function to create .env for admin web
#
function aw_files
{
    path="$(pwd)/admin-web-client/"

    echo "$ENV_CONTENT" | grep "^PUBLIC_[^G]" > "$path.env"
    sed -n 's/^AW_\(.*\)$/\1/p' "$ORIGINAL_ENV" >> "$path.env"
}


#
# Function to create .env for user web
#
function uw_files
{
    path="$(pwd)/user-web-client/"

    echo "$ENV_CONTENT" | grep "^PUBLIC_[^G]" > "$path.env"
    sed -n 's/^UW_\(.*\)$/\1/p' "$ORIGINAL_ENV" >> "$path.env"
}

#
# Function to create .env for user web
#
function ua_files
{
    path="$(pwd)/user-app-client/"

    echo "$ENV_CONTENT" | grep "^PUBLIC_[^G]" > "$path.env"
    sed -n 's/^UA_\(.*\)$/\1/p' "$ORIGINAL_ENV" >> "$path.env"
}


#
# Function to shut down the container
#
function app-down
{
    # Close the container and remove the images
    # Using --rmi local only removes the images that hasn't been "named" in docker-compose
    dev="$(docker ps | grep "mariadb-test")"
    if [ "$dev" == "" ]; then
        docker-compose down -v --rmi local
    else
        
        docker-compose -f docker-compose.dev.yml down -v --rmi local
    fi
}

#
# Process options
#
function main
{
    while (( $# ))
    do
        case "$1" in

            --help | -h)
                usage
                exit 0
            ;;

            --version | -v)
                version
                exit 0
            ;;

            prod          \
            | env         \
            | dev         \
            | bike        \
            | down)
                command="$1"
                shift
                app-"$command" "$@"
                exit 0
            ;;

            *)
                badUsage "Option/command not recognized."
                exit 1
            ;;

        esac
    done

    badUsage
    exit 1
}

main "$@"
