# docker-agilefant
![agilefant](http://i.imgur.com/ZLdI02W.png)

Dockerized Agilefant.

## Usage

### Use Docker Compose (TL;DR)

Install Docker Compose [first](https://docs.docker.com/compose/install/), then use the prepared docker-compose file to launch containers. You may change the credentials in the YAML file.

```bash
wget https://raw.githubusercontent.com/kcyeu/docker-compose/master/agilefant/docker-compose.yml
docker-composer up -d
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

