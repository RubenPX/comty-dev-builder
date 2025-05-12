# /bin/bash

# tested in mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm
# # Features ghcr.io/itsmechlark/features/redis-server

bash -i -c 'nvm install --lts && nvm use --lts'
git clone --recurse-submodules https://github.com/ragestudio/comty && cd comty
git apply CustomCodePach.patch
npm i
