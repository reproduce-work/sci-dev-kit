#!/bin/sh
nbdev_preview &
cd ~/_proc/_docs && hupper -m http.server 3000
# Check if a process is running on port 3000
#if ! netstat -tuln | grep ":3000 " > /dev/null; then
#    cd _proc/_docs && hupper -m http.server 3000 &
#fi
wait
