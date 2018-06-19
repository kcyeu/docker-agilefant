# docker-agilefant
![agilefant](http://i.imgur.com/ZLdI02W.png)

[![Build Status](https://travis-ci.org/kcyeu/docker-agilefant.svg?branch=master)](https://travis-ci.org/kcyeu/docker-agilefant) ![Agilefant 3.5.4](https://img.shields.io/badge/agilefant-3.5.4-brightgreen.svg) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

[Docker Registry: kcyeu/agilefant](https://hub.docker.com/r/kcyeu/agilefant/).

## Usage

### Use Docker Compose (TL;DR)

Install Docker Compose [first](https://docs.docker.com/compose/install/), then use the prepared docker-compose file to launch containers. You may change the credentials in the YAML file.

```bash
wget https://raw.githubusercontent.com/kcyeu/docker-compose/master/agilefant/docker-compose.yml
docker-compose up -d
```


### Use Docker (more detail)
To run the container, (optionally) start MySQL or other compatible RDBMS:

MySQL:
```bash
sudo docker run -d --name agilefant-db \
-e MYSQL_ROOT_PASSWORD=root-secret \
-e MYSQL_DATABASE=agilefant \
-e MYSQL_USER=agilefant \
-e MYSQL_PASSWORD=my-secret \
mysql:latest
```


, or MariaDB:
```bash
sudo docker run -d --name agilefant-db \
-e MYSQL_ROOT_PASSWORD=root-secret \
-e MYSQL_DATABASE=agilefant \
-e MYSQL_USER=agilefant \
-e MYSQL_PASSWORD=my-secret \
mariadb:latest
```

, then do the following to start container with linked mysql-server:
```bash
sudo docker run -d -p 8080:8080 --name agilefant-app \
--link agilefant-db:db kcyeu/agilefant
```

## System Requirements

### CPU
  * 1 core works but the application can be a bit slower due to having MySQL and Java app running on the same core
  * 2 cores is the recommended number of cores

### Memory
  * 1.5 GB RAM is the recommended memory size, since MySQL takes 1 GB to run smoothly and Tomcat with app needs 512 MB

