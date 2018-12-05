# Kong key-auth plugin demo

Simple demo showing how to use [Kong](https://konghq.com/) with the [key-auth plugin](https://docs.konghq.com/hub/kong-inc/key-auth/)

Start kong, kong-dashboard, postgres and the echo service by running the command below
```sh
$ docker-compose up
```

The following endpoints will come online
* Kong admin dashboard: http://localhost:8080
* Admin API: http://localhost:8001
* Kong Proxy API: http://localhost:8000

Now run 'setup_key_auth.sh'. This script will do the following:
* create a new service in kong for the echo-service
* add the route /echo-service to this new service
* install the key-auth plugin for the echo-service
* create a new consumer
* create an API key for this new consumer

After running this script, the curl call below should succeed

```sh
curl http://localhost:8000/echo-service \
    -H 'apikey: my-super-secret-key'
```

Note that Kong will include the headers 'x-consumer-username' and 'x-consumer-custom-id' which allows the service handling the request to distinguish between different users.
