MASTER_IP = 192.168.76.101

build:
	docker build --tag=iamlittle/base utils/
	docker build --tag=webservice webservice/
	docker build --tag=webapp webapp/
	docker build --tag=servicelocator servicelocator/

runservicelocator:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env PUBLIC_IP=$$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') servicelocator

runservicelocator_bash:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env PUBLIC_IP=$$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') servicelocator bash

runwebapp:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env MASTER_IP=$(MASTER_IP) --env PUBLIC_IP=$$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') \
	-p 80:5000 webapp

runwebapp_debug:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env MASTER_IP=$(MASTER_IP) --env PUBLIC_IP=$$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') \
	-p 80:5000 -v /vagrant/webapp:/usr/local/src/webapp:ro webapp

runwebapp_bash:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env MASTER_IP=$(MASTER_IP) --env PUBLIC_IP=$$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') \
	-p 80:5000 webapp bash

runwebservice:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env MASTER_IP=$(MASTER_IP) --env PUBLIC_IP=$$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') \
	-p 5001:5001 webservice

runwebservice_debug:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env MASTER_IP=$(MASTER_IP) --env PUBLIC_IP=$$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') \
	-p 5001:5001 -v /vagrant/webservice:/usr/local/src/webservice:ro webservice

runwebservice_bash:
	docker run -t -i -p 8001:8001 -p 4001:4001 --env SERVER_PORT=8001 --env CLIENT_PORT=4001 \
	--env MASTER_IP=$(MASTER_IP) --env PUBLIC_IP=$$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $$1}') \
	-p 5001:5001 webservice bash

stopall:
	docker stop $$(docker ps -q)

cleancontainers:
	docker rm $$(docker ps -aq)

cleanimages:
	-docker rmi $$(docker images | grep '<none>' | awk '{print $$3}')
	-docker rmi $$(docker images | grep 'vagrant_' | awk '{print $$3}')
	-docker rmi webapp
	-docker rmi webservice
	-docker rmi servicelocator

