#!/bin/sh

if [ ! -f "/app/iycms/cms" ]; then
    cp -r /opt/iycms/* /app/iycms/
fi

exec /app/iycms/cms
