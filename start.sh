#!/bin/sh

. .env
mkdir -p logs
openresty -p `pwd` -c conf/nginx.conf
