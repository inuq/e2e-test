#!/bin/bash
google-chrome &
pid=$!
echo ${pid}
sleep 5s
kill -9 ${pid}
