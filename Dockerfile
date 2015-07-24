# Dockerizing Logstash-forwarder:
# Dockerfile for building logstash-forwarder on an ubuntu machine

# OS to use
FROM phusion/baseimage

# Provisioning
## Install Go from the tar download
RUN apt-get update
RUN apt-get install git curl -y

## Download and build Go
RUN curl -L https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xvz -C /tmp && mv /tmp/go /usr/local/go

## Clone the Logstash-forwarder repo and build with Go
RUN git clone git://github.com/elasticsearch/logstash-forwarder.git /opt/logstash-forwarder
WORKDIR /opt/logstash-forwarder/
RUN /usr/local/go/bin/go build -o logstash-forwarder


# Configuration files
## logstash config
WORKDIR /logstash-forwarder
COPY resources/logstash-forwarder.conf /logstash-forwarder/logstash-forwarder.conf
COPY resources/logstash-forwarder.key /logstash-forwarder/logstash-forwarder.key
COPY resources/logstash-forwarder.crt /logstash-forwarder/logstash-forwarder.crt


# How the docker container is interacted with
##
ENTRYPOINT ["/opt/logstash-forwarder/logstash-forwarder"]
CMD ["-config", "/logstash-forwarder/logstash-forwarder.conf", ">> /var/log/logstash-forwarder.log", "2>> /var/log/logstash-forwarder.log"]
