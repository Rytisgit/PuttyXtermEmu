#!/bin/bash
docker run --rm dockcross/linux-x64 > ./dockcross-linux-x64
docker run --rm dockcross/linux-x86 > ./dockcross-linux-x86
docker run --rm dockcross/web-wasm > ./dockcross-web-wasm
chmod +x ./dockcross-linux-x64
chmod +x ./dockcross-linux-x86
chmod +x ./dockcross-web-wasm