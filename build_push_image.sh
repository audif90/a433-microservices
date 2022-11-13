#!/bin/bash

# Clear agar script bersih
clear

# Build item-app docker image
echo "\e[32mBuilding Docker Image!\e[0m"
docker build -t item-app:v1 .

# Lihat daftar di local
echo "\e[32mListing Local Docker Images!\e[0m"
docker image ls

# Ubah nama docker image dengan format Github Packages
echo "\e[32mTagging Docker Image for Github Packages\e[0m"
docker tag $(docker image ls --filter="reference=item-app:v1" --format={{.ID}}) ghcr.io/audif90/item-app:v1

# Login ke Github Packages
echo "\e[32mLogin to Github Packages!\e[0m"
echo $PAT | docker login ghcr.io --username audif90 --password-stdin

# Push image ke Github Packages
echo "\e[32mPushing to Github Packages!\e[0m"
docker push ghcr.io/audif90/item-app:v1