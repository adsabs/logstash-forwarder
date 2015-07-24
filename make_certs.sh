#!/bin/bash

openssl req -x509 -batch -subj '/CN=logstash.adsabs' -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt -days 3650
mv logstash-forwarder.crt resources/logstash-forwarder.crt
mv logstash-forwarder.key resources/logstash-forwarder.key
