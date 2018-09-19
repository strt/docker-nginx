#!/bin/sh

# Make us use PID 1
exec /usr/sbin/nginx -g "daemon off;"
