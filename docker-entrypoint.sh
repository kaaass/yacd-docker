#!/bin/sh
sed -i "s|http://127.0.0.1:9090|$YACD_DEFAULT|" /usr/share/nginx/html/index.html
nginx -g "daemon off;"
