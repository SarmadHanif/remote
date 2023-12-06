#!/bin/bash
dir_placeholder="/home/ubuntu/fe-qa"
compose_file_placeholder="compose-fe-qa.yaml"
docker_repo_placeholder="troontech/icnxchngfe"
image_detail=$(docker images | awk '/qa/')
image_name=$(echo "$image_detail" | awk '/qa/ {print $2}')
echo "$image_name"
if [ "$image_name" = "qa" ];
then echo "---image found---";
cd $dir_placeholder
docker compose -f $compose_file_placeholder down
sleep 1
docker rmi -f $docker_repo_placeholder:$image_name
else echo "-----image not found----";
fi;
cd $dir_placeholder
sleep 10
docker compose -f $compose_file_placeholder up -d
