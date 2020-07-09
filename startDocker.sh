#!/bin/bash

DESKTOP_PORT=1276
IMAGE_NAME="loveyourneighbor"
TAG="v0"

sudo docker stop $IMAGE_NAME &> /dev/null && sudo docker rm $IMAGE_NAME &> /dev/null
sudo docker build -t $IMAGE_NAME:$TAG . && sudo docker run -dit --name $IMAGE_NAME -p $DESKTOP_PORT:80 $IMAGE_NAME:$TAG
