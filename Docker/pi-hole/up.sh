#!/bin/bash
if [[ $(uname -m) = "x86_64" ]]
then
	# To Do, reconocer si esta conectado por cable o wifi
	echo "Architectura X86"
	INTERFAZ="wlp3s0"
	if [[ ! -z $1 ]]
	then
		INTERFAZ=$1
	fi
	IP="$(ip addr show $INTERFAZ | awk '/inet / {print$2}' | cut -d/ -f1)"
elif [[ $(uname -m) = "armv7l" ]]
then
	echo "Architectura armhf"
	IP="$(ip addr show eth0 | awk '/inet / {print$2}' | cut -d/ -f1)"
fi
echo "IP: "$IP
