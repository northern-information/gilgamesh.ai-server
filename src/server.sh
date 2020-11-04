#!/bin/bash

nohup python -m flask run --no-reload --no-debugger --host=0.0.0.0 &

nohup python -m http.server 8080 --directory /home/gilgamesh/banner &
