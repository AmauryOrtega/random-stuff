# Mysql y Phpmyadmin con Docker

Las aplicaciones siempre deben responder correctamente si la BD no esta disponible. [Referencia](https://docs.docker.com/compose/startup-order/)

Para ejecutar todo junto `docker-compose up -d`. Y para destruir `docker-compose down`.

>ADVERTENCIA: La imagen mysql utilizada crea volumenes anonimos para almacenar la base de datos, para revisar los volumenes creados `docker volume ls`. Si se desean eliminar todos los volumenes presentes, usar `docker volume prune`, cuidado que esto puede eliminar volumenes importantes que no esten en uso por algun contenedor.

## MySQL

```bash
docker run --rm --name mysql \
-e MYSQL_USER=aroc -e MYSQL_PASSWORD=aroc123 \
-e MYSQL_DATABASE=mi-base-de-datos -e MYSQL_ALLOW_EMPTY_PASSWORD=1 \
-p 4000:3306 -d mysql:5.7.22
```

Referencias utiles:
- [Permisos de usuarios en mysql](https://dev.mysql.com/doc/refman/8.0/en/adding-users.html)
- [Como correr scripts](https://dev.mysql.com/doc/refman/8.0/en/mysql-batch-commands.html)

Usar mysql `mysql -h <IP> -u aroc -P 4000 --password=aroc123 mi-base-de-datos`.

### Autenticacion con MySQL 8.x

El metodo de autenticación cambio, ahora utiliza cifrado por default usando `caching_sha2_password`. Mas info [aqui](https://dev.mysql.com/doc/refman/8.0/en/caching-sha2-pluggable-authentication.html). Las soluciones propuestas por mysql son [estas](https://dev.mysql.com/doc/refman/8.0/en/upgrading-from-previous-series.html#upgrade-caching-sha2-password).

### MySQL Workbench bug

Error relacionado con locale. [Solucion](https://bugs.mysql.com/bug.php?id=84908)

```
1 - edit: /etc/locale.gen 
Find and uncoment line like this: 
#en_US.UTF-8 UTF-8

2 - run: sudo locale-gen
Generating locales...
  en_US.UTF-8... done
  pt_BR.UTF-8... done
Generation complete.
```

## phpMyAdmin

```bash
docker run --rm --name phpmyadmin -e MYSQL_ROOT_PASSWORD="" \
-e MYSQL_USER=aroc -e MYSQL_PASSWORD=aroc123 -e PMA_ARBITRARY=1 \
-p 8080:80 phpmyadmin/phpmyadmin:4.7
```
