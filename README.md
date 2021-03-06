# docker-code-server

## Build and publish images

Leveraging all build and push actions to Docker Comopse:

    docker-compose build
    docker-compose push

Build step is a bit different for the M1 processor:

    docker-compose build --build-arg ARCH=arm64

## Local development

    docker-compose up --build [variant]

Supported variants are:

* **alpine**
* **ubuntu**

To cleanup the environment just run:

    docker-compose down

This will remove the services currently running

## Releasing a version

The format of the image tag is defined as following:

[code_server_version]-r[revision]-[variant]

* `version`: The current version of the **code-server** package
* `revision`: The current build revision. This number increments with 1 for each new release. Start with value of 1.
* `variant`: Represents the image platform variant. Supported values are: **alpine**, **ubuntu**

Before the release please update the `version` and `revision` values in the .env file. Create a release with the corresponding tag name: `[version]-r[revision]`.
