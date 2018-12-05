# https://docs.konghq.com/0.14.x/auth/

# create service
curl -i -X POST \
   --url http://localhost:8001/services/ \
   --data 'name=echo-service' \
   --data 'url=http://localhost:3000'

# add route
curl -i -X POST \
   --url http://localhost:8001/services/echo-service/routes \
   --data 'paths[]=/echo-service'

# install key-auth plugin
curl -i -X POST \
   --url http://localhost:8001/services/echo-service/plugins/ \
   --data 'name=key-auth'

# create a consumer
curl -X POST http://localhost:8001/consumers/ \
    --data "username=my-username" \
    --data "custom_id=my-user-id"

# create api key for the consumer
curl -X POST http://localhost:8001/consumers/my-username/key-auth \
	--data "key=my-super-secret-key"
