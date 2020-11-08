#!/bin/bash

export FLASK_APP=play.py

export LC_ALL=en_US.utf-8

export LANG=en_US.utf-8

export NUMBA_CACHE_DIR=/tmp

python3 -m flask run --no-reload --no-debugger --host=0.0.0.0 > flask.log 2>&1

#cd banner

#python3 -m http.server 8080 > ../http.log
