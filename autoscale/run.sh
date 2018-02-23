docker stack rm example
sleep 20 # Wait for stack remove to complete
docker stack deploy example -c docker-compose.yml
