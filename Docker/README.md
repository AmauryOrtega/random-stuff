# Tips

## Docker ps

`docker ps -a --format "table {{.ID}} {{.Names}}\\t{{.Image}}\\t{{.Ports}}\\t{{.Size}}\\t{{.Status}}\\t{{.RunningFor}}"`

```shell
CONTAINER ID NAMES              IMAGE                                        PORTS                                                        SIZE                    STATUS                    CREATED
490120f798ee pihole_pi-hole_1   diginc/pi-hole-multiarch:v3.3_debian_armhf   0.0.0.0:53->53/tcp, 0.0.0.0:80->80/tcp, 0.0.0.0:53->53/udp   298kB (virtual 311MB)   Up 26 minutes (healthy)   26 minutes ago
e4f42699c7b6 portainer_ui_1     portainer/portainer:1.19.1                   0.0.0.0:9000->9000/tcp                                       0B (virtual 49.3MB)     Up 28 minutes             28 minutes ago
```

Es posible ponerte este comando en un alias o añadir el formato a `$HOME/.docker/config.json` para alterar el formato predeterminado de `docker ps`.

Al usar el alias es necesario poner `\"` para utilizar `"` dentro del comando.

```shell
alias dockerps="docker ps -a --format \"table {{.ID}} {{.Names}}\\t{{.Image}}\\t{{.Ports}}\\t{{.Size}}\\t{{.Status}}\\t{{.RunningFor}}\""
```

`$HOME/.docker/config.json`

```json
{
    ...
    "psFormat": "table {{.ID}} {{.Names}}\\t{{.Image}}\\t{{.Ports}}\\t{{.Size}}\\t{{.Status}}\\t{{.RunningFor}}",
    ...
}
```