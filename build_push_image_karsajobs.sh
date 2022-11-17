#!/bin/bash

echo -e "\e[32mClear agar screen lebih bersih!\e[0m"
clear

echo -e "\e[32mBuilding Docker Image!\e[0m"
docker build -t ghcr.io/audif90/karsajobs:latest .

echo -e "\e[32mLogin to GitHub Packages!\e[0m"
echo $CR_PAT | docker login ghcr.io -u $USERNAME --password-stdin

echo -e "\e[32mPushing to GitHub Packages\e[0m"
docker push ghcr.io/audif90/karsajobs:latest