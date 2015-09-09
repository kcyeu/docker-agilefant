# docker-agilefant
![agilefant](http://i.imgur.com/ZLdI02W.png =240x)

Dockerized Agilefant.

## Usage

### Use Docker
To run the container, (optionally) start MySQL or other compatible RDBMS:

MySQL:
```
sudo docker run -d --name agilefant-db \
-e MYSQL_ROOT_PASSWORD=root-secret \
-e MYSQL_DATABASE=agilefant \
-e MYSQL_USER=agilefant \
-e MYSQL_PASSWORD=my-secret \
mysql:latest
```

MariaDB:
```
sudo docker run -d --name agilefant-db \
-e MYSQL_ROOT_PASSWORD=root-secret \
-e MYSQL_DATABASE=agilefant \
-e MYSQL_USER=agilefant \
-e MYSQL_PASSWORD=my-secret \
mariadb:latest
```

, then do the following to start container with linked mysql-server:

```
sudo docker run -d -p 8080:8080 --name agilefant-app --link agilefant-db:db kcyeu/agilefant
```

### Use Docker Compose

Install Docker Compose [first](https://docs.docker.com/compose/install/), then
use the prepared docker-compose file to launch containers. You may change the 
credentials in the YAML file.

```
wget https://raw.githubusercontent.com/kcyeu/docker-compose/master/agilefant/docker-compose.yml
docker-composer up -d
```
