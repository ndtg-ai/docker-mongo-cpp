![Docker Stars](https://img.shields.io/docker/stars/ntuangiang/mongo-cpp.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/ntuangiang/mongo-cpp.svg)
![Docker Automated build](https://img.shields.io/docker/automated/ntuangiang/mongo-cpp.svg)

# Cpp

A [C++](https://en.cppreference.com/w/) program is a sequence of text files (typically header and source files) that contain declarations. They undergo translation to become an executable program, which is executed when the [C++](https://en.cppreference.com/w/) implementation calls its main function.

# MongoDB C++ Driver

Welcome to the [MongoDB C++](http://mongocxx.org) driver. On this site, you’ll find documentation to help you get the most from [MongoDB](https://www.mongodb.com) and [C++](https://en.cppreference.com/w/). 

## Docker Repository
[ntuangiang/mongo-cpp](https://hub.docker.com/r/ntuangiang/mongo-cpp) 

## Usage
- Start services

```shell script
docker run -d -p 2202:22 -p 7778:7777 ntuangiang/mongo-cpp
```

- Docker compose

```yaml
version: "3.8"

services:
  cpp:
    image: ntuangiang/mongo-cpp # Image latest
    ports:
      - "2202:22" # Remote
      - "7778:7777" # Debug
    restart: always

  db:
    image: mongo
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: root
    volumes:
      - ./data:/data/db
    ports:
      - "27018:27017"
      - "8082:8081"
    restart: always
```

## LICENSE

MIT License
