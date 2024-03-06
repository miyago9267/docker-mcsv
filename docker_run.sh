#!/bin/bash
user="user"
name="mcsv"
port="25565"
java_version="21-slim-bullseye"

docker build \
    --build-arg JAVA_VERSION=$java_version \
    $@ -t $user/$name:latest . || exit
[ "$(docker ps | grep $name)" ] && docker kill $name
[ "$(docker ps -a | grep $name)" ] && docker rm $name

docker run \
	-itd \
	-u $(id -u):$(id -g) \
	-v ./:/app \
	--name $name \
    -p $port:25565 \
    --network bridge \
	$user/$name:latest

if command -v ufw-docker &> /dev/null; then
    ufw-docker allow $name 25565/tcp
else
    ufw allow $port/tcp
fi