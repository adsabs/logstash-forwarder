# logstash-forwarder

Docker images for logstash-forwarder.

SSL files are based on DNS names and
do not contain relevant IPs.

To create new certs use make_certs.sh.

Basic usage:

  1. `docker build -t adsabs/logstash-forwarder .`
  1. `docker run -d --name logstash-forwarder -v /tmp:/tmp --restart=always adsabs/logstash-forwarder`
