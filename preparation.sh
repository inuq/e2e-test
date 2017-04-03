#!/bin/bash
export DISPLAY=:1
google-chrome &
pid=$!
echo ${pid}
sleep 5s
kill -9 ${pid}
