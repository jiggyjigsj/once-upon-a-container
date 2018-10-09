# once-upon-a-container

Create container on demand using Docker?

## Usage

Either assign environment variables `USER` and `PASSWORD` or use the default `USER` of `groot` and `password` of `trymebruh`.

Modify the `docker-compose.yml` file:

```bash
version: '3.6'
services:
  sshcontainer:
    build:
      context: "."
      dockerfile: Dockerfile
    image: ssh-me
    environment:
    - USER=groot
    - PASSWORD=testing123
    expose:
    - '22'
    ports:
    - '1023:22'
```

## TODO

Create a script that allows the user to define the following:

* Define the number of container
* Automate ssh key generation
* Create and add aliases for logging into containers
* Define the image as well
