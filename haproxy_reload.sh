#!/bin/bash
haproxy -f /app/haproxy.cfg -sf $(</var/run/haproxy.pid)