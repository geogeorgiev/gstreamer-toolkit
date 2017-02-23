#!/bin/bash 
echo "Running the script ..."

CONTAINER_NAME=gstreamer
SHARED_FOLDER=${1:-media}

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

docker run -it --name gstreamer --privileged -v ${SHARED_FOLDER}:/root/media
 gooshan/gstreamer:ubuntu 

echo "Finished running the script."
