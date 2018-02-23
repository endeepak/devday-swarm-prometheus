## Steps

### Base setup

* Run

```sh
git clone https://github.com/endeepak/devday-swarm-prometheus
cd jukebox
docker stack deploy --compose-file jukebox-stack.yml jukebox
```

* Visit http://localhost:5001/songs/random


### Load balancing

* Run

```sh
docker service scale jukebox_web=2
```

* Visit http://localhost:5001/songs/random

### Service discovery

* Run

```sh
docker service scale jukebox_api=2
docker ps | grep jukebox_web
docker exec -it <web-container-id> sh
nslookup api
nslookup tasks.api
```

