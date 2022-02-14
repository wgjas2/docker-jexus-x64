#!/bin/bash -e

vtime=$(date "+%Y.%m.%d")

docker build -t wgjas2/jexus-x64:6.4 .
docker build --rm --no-cache -t wgjas2/jexus-x64:6.4 .
docker tag wgjas2/jexus-x64:6.4 wgjas2/jexus-x64:latest
docker tag wgjas2/jexus-x64:6.4 wgjas2/jexus-x64:6.4-${vtime}
docker push wgjas2/jexus-x64:6.4
docker push wgjas2/jexus-x64:latest
docker push wgjas2/jexus-x64:6.4-${vtime}