#!/bin/bash
google-chrome &
pid=$!
sleep 3s
kill -9 ${pid}
