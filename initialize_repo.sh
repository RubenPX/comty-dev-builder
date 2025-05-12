# /bin/bash

# tested in mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm

git clone --recurse-submodules https://github.com/ragestudio/comty && cd comty

nvm install -lts
nvm use --lts
npm i -g yarn

yarn
cd packages/server/ && yarn && cd ../..
cd packages/app/ && yarn && cd ../..
cd packages/cli/ && yarn && cd ../..