# nginx-proxy-swarm

For run this container you need to map the volume of the swarm certificates. 
And pass an env variable ENDPOINT_SWARM_MASTER with IP and PORT of your swarm master.

Exemple:
docker run -d --name nginx-proxy -v /home/core/.docker/machine/certs:/certs/ -p 80:80 --env ENDPOINT_SWARM_MASTER=tcp://104.236.27.119:3376 urik/nginx-proxy-swarm
