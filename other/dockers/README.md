My local dockers
================


Note
----
I'm using docker for dev, using the containers like VM. This is a bad practice, please **DON'T DO THAT**

Please use the oficial docker images (see https://hub.docker.com/) and `docker-container`.


Usage
-----
To use an image:

```
make docker.build
make docker.bash
```
or

```
docker build -t <name> .
docker run -ti <name> bash
```