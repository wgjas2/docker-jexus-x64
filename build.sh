#!/bin/bash -e

vtime=$(date "+%Y.%m.%d")

docker build --rm --no-cache -t wgjas2/jexus-x64:7.0 .
docker tag wgjas2/jexus-x64:7.0 wgjas2/jexus-x64:latest
docker tag wgjas2/jexus-x64:7.0 wgjas2/jexus-x64:7.0-${vtime}
docker push wgjas2/jexus-x64:7.0
docker push wgjas2/jexus-x64:latest
docker push wgjas2/jexus-x64:7.0-${vtime}