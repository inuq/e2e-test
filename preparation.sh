#!/bin/bash
export DISPLAY=:1
google-chrome &
pid=$!
echo ${pid}
sleep $1
kill -9 ${pid}
