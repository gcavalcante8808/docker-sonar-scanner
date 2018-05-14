#!/bin/bash

set -e

if [[ ! -f "sonarqube.properties" ]]; then
    if [[ -z "${SONAR_SERVER}" ]]; then
        echo "No Sonar Server Provided. Exiting ...."
        exit 1
    fi

    if [[ -z "${SONAR_KEY}" ]]; then
        echo "You Need to Provide API Key to continue. Exiting ..."
        exit 1
    fi

    if [[ -z "${SONAR_PROJECT}" ]]; then
       echo "You need to provide sonar project name. Exiting ..."
       exit 1
    fi

    echo "No sonarqube.properties found. Running with default options and some extra if provided in the command."
    exec /usr/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT} -Dsonar.host.url=${SONAR_SERVER} -Dsonar.login=${SONAR_KEY} -Dsonar.sources=. "$@"

else 
    echo "sonarqube.properties found, running scanner with only provided args if any."
    exec /usr/bin/sonar-scanner "$@"
fi


