# Raspberry Pi

DHCP Reservation: `192.168.0.116`.

pi:pi123

## Upgrade

```shell
apt update
apt [upgrade|dist-upgrade]
```

## Remove package

`apt [remove|purge] <package>`. Purge removes and deletes config files related to \<package>

## Docker

```shell
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker <user>
sudo systemctl [enable|start] docker
```

### docker-compose
```shell
pip install docker-compose
```

## Pi-hole

### Consideraciones

Parametros a cambiar:

- `ServerIP=192.168.0.16` > `ServerIP=<IP>`
- `WEBPASSWORD=pi123` > `WEBPASSWORD=<password de admin>`

> Es mejor crear el directorio `/home/pi/pi-hole-config` por los siguientes parametros:

- `-v /home/pi/pi-hole-config/pihole:/etc/pihole/`
  - Monta `/etc/pihole` del contenedor en `/home/pi/pi-hole-config/pihole` del host.
- `-v /home/pi/pi-hole-config/dnsmasq.d:/etc/dnsmasq.d/`
  - Monta `/etc/dnsmasq.d` del contenedor en `/home/pi/pi-hole-config/dnsmasq.d` del host.

```
docker run -d --name pihole \
-p 53:53/tcp -p 53:53/udp -p 80:80 \
-e ServerIP=192.168.0.16 -e WEBPASSWORD=pi123 \
-e TZ=America/Bogota -v /home/pi/pi-hole-config/pihole:/etc/pihole/ \
-v /home/pi/pi-hole-config/dnsmasq.d:/etc/dnsmasq.d/ \
--restart=unless-stopped diginc/pi-hole-multiarch:debian_armhf
```

http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/

https://docs.docker.com/develop/

Como tratar con volumes: https://docs.docker.com/engine/reference/commandline/volume_create/
