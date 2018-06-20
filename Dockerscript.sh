#!/bin/bash
file="target/docker/image-id"

img_id=$(cat "$file")      

echo $img_id   
docker run --name tomcatserver -p 8081:8080 $img_id &
c_id=$(sudo docker ps -aqf name=tomcatserver)
sudo docker commit $c_id tomcatserver
