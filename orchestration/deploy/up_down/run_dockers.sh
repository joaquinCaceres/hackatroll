# Enviromental variables file: --env-file <file>
# Start all the services in docker compose: up
# Rebuild docker in each deploy: --build
# Running in background: --detach
# To not instance a container: --scale <service_name>=0


docker-compose -f orchestration/deploy/build/docker-compose.yaml --env-file orchestration/deploy/build/cityzen.env up --build --detach

# Remove temporal images and containers:
docker rmi `docker images | grep none | awk '{print $3}'` 2> /dev/null
docker rm $(docker ps -qa --no-trunc --filter "status=exited") 2> /dev/null