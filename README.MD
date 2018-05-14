Docker Sonar-Scanner
--------------------

This repository contains base information about gcavalcante8808/sonar-scanner image.

Supported Versions
------------------

The current stable versioni (3.1.0.1141 in this moment) is supported. Check the Supported Versions file at ([Supported Versions](https://github.com/gcavalcante8808/docker-sonar-scanner/blob/master/supported_versions)).

How To use
----------

The image was built with "/usr/bin/sonar-scanner" as the entrypoint, so the simpliest way to run sonar scanner is to provide the options as the command after the image name, like the following statement:

```
docker run -it -e SONAR_PROJECT=example -e SONAR_SERVER=http://example.com -e SONAR_KEY=apikeyhere --rm -v /code:/code --workdir /code gcavalcante8808/sonar-scanner bash -c 'sonar-scanner -Dsonar.projectKey=${SONAR_PROJET} -Dsonar.sources=. -Dsonar.python.coverage.reportPath=./coverage.xml -Dsonar.exclusions=**/*.js -Dsonar.host.url=${SONAR_SERVER}   -Dsonar.login=${SONAR_KEY}'
```

Otherwise, if your project have a `sonar-project.properties` file with all needed information, you just need to run the following statement:

```
docker run -it -v /code:/code --workdir /code gcavalcante8808/sonar-scanner
```

In both cases, when the sonar-scanner exits, the created container is removed automatically.

You can still use docker-compose; after cloning and changing the sonar.env file with your environment info, run the following command:

```
docker-compose up
```

In this example, the /code folder was mounted as bind to /code in the container and the workdir was set to /code (to simplify -Dsonar.sources= and pythonCoveragereport paths).

Author
------

Author: Gabriel Abdalla Cavalcante Silva (gabriel.cavalcante88@gmail.com)
