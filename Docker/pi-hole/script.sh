#!/bin/bash
# Necesito quitar $IP del docker-compose, hacer que el gitignore ignore todos los .env y que el script que haga, cree el .env con ServerIP=...
# CodeAnywhere, editor en linea que permite usar contenedores
# uso
printf "### AYUDA ###
Uso: ./relative/path/to/script.sh [INTERFAZ]\n\n"

# Arquitectura del host
printf "### Detectando architectura ###\n"

ARCH=$(uname -m)
printf $ARCH" "

case $ARCH in
	x86_64)
		printf "Portatil\n\n"
		INTERFAZ="wlp3s0"
		COMPOSE_FILE="docker-compose.yml"
		;;
	armv7l)
		printf "Raspberry Pi 3 (armhf)\n\n"
		INTERFAZ="eth0"
		COMPOSE_FILE="docker-compose-armhf.yml"
		;;
esac

# Interfaz de red
printf "### Detectando IP ###\n"

if [[ ! -z $1 ]]
then
	INTERFAZ=$1
else
   	printf "No se proporciono una interfaz, se utilizara "$INTERFAZ".\n"
    printf "En caso que quiera usar otra, usar source "$0" [INTERFAZ]\n"
fi

IP="$(ip addr show $INTERFAZ | awk '/inet / {print$2}' | cut -d/ -f1)"
printf "IP de interfaz "$INTERFAZ": "$IP"\n\n"
export IP

# Iniciando docker-compose
CURRENT_DIRECTORY=`/bin/pwd`
BASE_DIRECTORY=$(dirname $0)
ABSOLUTE_PATH=$(readlink -f $0)
ABSOLUTE_DIRECTORY=$(dirname $ABSOLUTE_PATH)
#printf "CURRENT_DIRECTORY is "$CURRENT_DIRECTORY"\n"
#printf "BASE_DIRECTORY is "$BASE_DIRECTORY"\n"
#printf "ABSOLUTE_PATH is "$ABSOLUTE_PATH"\n"
#printf "ABSOLUTE_DIRECTORY is "$ABSOLUTE_DIRECTORY"\n"
printf "Comando a ejecutar:\n"
printf "docker-compose -f "$ABSOLUTE_DIRECTORY/$COMPOSE_FILE" up -d\n"