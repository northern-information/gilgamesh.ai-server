#!/bin/bash

nohup python3 -m flask run --no-reload --no-debugger --host=0.0.0.0 &

nohup python3 -m http.server 8080 --directory /home/gilgamesh/banner &
