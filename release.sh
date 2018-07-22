#!/bin/bash -e
# release to docker hub

echo "Logging in to dockerhub"
docker login || exit 2

echo "Building goethite/goswim-kubectl:latest image"
docker build -t goethite/goswim-kubectl:latest . || exit 2

echo "Pushing goethite/goswim-kubectl:latest to dockerhub"
docker push goethite/goswim-kubectl:latest || exit 2
