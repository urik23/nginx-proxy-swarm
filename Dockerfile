FROM nginx:1.9.5
MAINTAINER Oriol Moya Ahufinger oriol.moya@gmail.com

#Creacio de directoris
RUN mkdir -p /opt/bin
RUN mkdir -p /certs
RUN mkdir -p /template

#Instal·lar wget

RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    wget

#Instal·lar docker-gen

RUN wget https://github.com/jwilder/docker-gen/releases/download/0.4.3/docker-gen-linux-amd64-0.4.3.tar.gz
RUN tar xvzf docker-gen-linux-amd64-0.4.3.tar.gz 
RUN chmod +x docker-gen
RUN mv docker-gen /opt/bin

#Copiar template, conf i script start
ADD assets/nginx.tmpl /template/nginx.tmpl
ADD assets/nginx.conf /etc/nginx/nginx.conf
ADD assets/run.sh /opt/bin/run.sh

#Donem permís d'execució
RUN chmod +x /opt/bin/run.sh

CMD ["/opt/bin/run.sh"]
