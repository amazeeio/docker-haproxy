#!/bin/bash
haproxy -f /app/haproxy.cfg
docker-gen -watch -only-exposed -notify "/app/haproxy_reload.sh" /app/haproxy.tmpl /app/haproxy.cfg