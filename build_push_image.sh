#!/bin/bash

# Clear agar script bersih
clear

# Build item-app docker image
docker build -t item-app:v1 .

# Lihat daftar di local
docker image ls

# Ubah nama docker image dengan format Github Packages
docker tag $(docker image ls --filter="reference=item-app:v1" --format={{.ID}}) ghcr.io/audif90/item-app:v1

# Login ke Github Packages
echo $PASSWORD | docker login ghcr.io --username audif90 --password-stdin

# Push image ke Github Packages
docker push ghcr.io/audif90/item-app:v1