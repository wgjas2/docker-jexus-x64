# Jexus x64 Pro (Standalone) in docker

## Version Info:

- Jexus x64 Pro (Standalone) 6.4.x
- debian:buster-slim

## Usage:

1. Get the image with command:

```sh
# latest version
docker pull wgjas2/jexus-x64:latest
# 6.4.x latest version
docker pull wgjas2/jexus-x64:6.4
# 6.4.x build day version
docker pull wgjas2/jexus-x64:6.4-2022.02.14
```

2. Prepare the directors for volumes:

```sh
mkdir -p "$(pwd)/jexus/conf"
mkdir -p "$(pwd)/jexus/www"
mkdir -p "$(pwd)/jexus/log"
```

3. Copy your website config file to `$(pwd)/jexus/conf` folder, Copy your websites to `$(pwd)/jexus/www` folder

4. Run the image with command:

```sh
docker run \
    --detach \
    --name jexus \
    --restart unless-stopped \
    --publish 8080:80 \
    --volume $(pwd)/jexus/www:/var/www \
    --volume $(pwd)/jexus/conf:/usr/jexus/siteconf \
    --volume $(pwd)/jexus/log:/usr/jexus/log \
    wgjas2/jexus-x64:latest
```

5. Then browse [http://127.0.0.1:8080/info](http://127.0.0.1:8080/info) with your faverite borwser, see what happens.

> You can change the port 8080 as your like.

## Usage (docker-compose):

> docker-compose.yml:

```yaml
version: "3.9"
services:
  jexus:
    container_name: jexus
    image: wgjas2/jexus-x64:latest
    restart: always
    volumes:
      - ./jexus/conf:/usr/jexus/siteconf
      - ./jexus/log:/usr/jexus/log
      - ./jexus/www:/var/www
      - /etc/localtime:/etc/localtime
    ports:
      - "8080:80"
```
