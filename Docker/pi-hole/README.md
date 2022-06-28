# Pi-Hole guide on Raspbian buster

## Install Docker and docker-compose

```shell
# Install Docker dependencies
sudo apt-get update -y && apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Install Docker
curl https://get.docker.com -o get-docker.sh && sh get-docker.sh && rm get-docker.sh

# Give your user permission to use docker. By default the user is pi, change it if necessary
sudo usermod -aG docker pi

# Enable docker service on boot
sudo systemctl enable docker && sudo systemctl start docker

# Logout and login or reboot
sudo reboot now

# Install docker--compose
sudo apt-get install -y docker-compose
```

## Docker-compose file for pi-hole

```shell
mkdir pi-hole
cd pi-hole
```

### a. Download

```shell
wget https://amauryortega.dev/pi-hole.yml -o docker-compose.yml
```

### b. Manual

Create a file named `docker-compose.yml` with the following content:

```yml
version: '3.4'

services:
  app:
    image: pihole/pihole:4.3.1-4
    ports:
      # DNS Service
      - "53:53/tcp"
      - "53:53/udp"
      # Web Service
      - "80:80/tcp"
      - "443:443/tcp"
      # DHCP Service
      # - "67:67/udp"
    environment:
      # - ServerIP=192.168.1.105
      - WEBPASSWORD=some_random_password
      - TZ=Europe/Amsterdam
    volumes:
      - app_config:/etc/pihole/
      - dns_config:/etc/dnsmasq.d/
    # DNS Settings for the pi-hole service
    dns:
      - 127.0.0.1
      - 1.1.1.1
    restart: unless-stopped
    # Uncomment the below 2 lines when DHCP Service is used
    # cap_add:
    #   - NET_ADMIN

volumes:
  app_config:
  dns_config:
```

## Start Pi-Hole

```shell
docker-compose up -d
```
