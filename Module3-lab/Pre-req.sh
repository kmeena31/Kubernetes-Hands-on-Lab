#!/bin/bash
set -e 
#Trainers: pre-load the lab images into the kind cluster before class

PLATFORM=$(docker version --format '{{.Server.Os}}/{{.Server.Arch}}')   # e.g. linux/amd64 or linux/arm64
for img in nginx:1.28-alpine busybox:1.37; do
  docker pull --platform "$PLATFORM" "$img"
  docker save --platform "$PLATFORM" -o image.tar "$img"
  kind load image-archive image.tar --name lab
done
rm -f image.tar
