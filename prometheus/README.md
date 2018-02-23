## Steps

We will test monitoring jukebox services mentioned in the jukebox folder sibling to this folder

* Ensure you have base setup mentioned in jukebox folder

* Run

```sh
cd prometheus
docker stack deploy --compose-file monitoring-stack.yml monitoring
```

* Visit http://localhost:9090 for prometheus UI

* Generate load on api and web

```sh
ab -c 2 -n 1000 http://127.0.0.1:5000/api/songs/random
ab -c 2 -n 1000 http://127.0.0.1:5001/songs/random
```

* Verify metrics exposed in http://127.0.0.1:8000 and http://127.0.0.1:8001

* Visit http://localhost:9090 and query for metrics

```
flask_request_count
flask_request_count{endpoint="/api/songs/random"}
flask_request_count{http_status="200"}
flask_request_count{endpoint=~"/api.*", http_status="200"}

container_memory_usage_bytes
sum(container_memory_usage_bytes) by (name)
sum(container_memory_usage_bytes) by (name) > 20000000

container_cpu_usage_seconds_total
sum(rate(container_cpu_usage_seconds_total[30s])) by (name) * 100

flask_request_latency_seconds_bucket
```
