#!/bin/bash
./dockcross-web-wasm make clean -f ./WASM/Makefile  -C ./Putty
./dockcross-web-wasm make -f ./WASM/Makefile  -C ./Putty
./dockcross-linux-x64 make clean -f ./UNIX/Makefile  -C ./Putty
./dockcross-linux-x64 make -f ./UNIX/Makefile  -C ./Putty
./dockcross-linux-x86 make clean -f ./UNIXx86/Makefile  -C ./Putty
./dockcross-linux-x86 make -f ./UNIXx86/Makefile  -C ./Putty
