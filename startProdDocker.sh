#!/bin/bash

DESKTOP_PORT=1276
IMAGE_NAME="lyn"
TAG="0.0.2"

sudo docker stop $IMAGE_NAME &> /dev/null && sudo docker rm $IMAGE_NAME &> /dev/null

sudo docker build \
    -t $IMAGE_NAME:$TAG \
    .
    
sudo docker run \
    -dit \
    --rm \
    -v ${PWD}:/usr/src/app \
    -v /usr/src/app/node_modules \
    --name $IMAGE_NAME \
    -p $DESKTOP_PORT:80 \
    -e CHOKIDAR_USEPOLLING=true \
    $IMAGE_NAME:$TAG
