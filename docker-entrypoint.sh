#!/bin/bash
set -e

if [ "$1" = 'varnish' ]; then
    exec varnishd -F -u varnish \
        -a :80 \
        -T localhost:6082 \
        -f $VCL_CONFIG \
        -s malloc,$CACHE_SIZE \
        $VARNISHD_PARAMS
fi

exec "$@"