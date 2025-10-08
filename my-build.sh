#!/bin/bash

export NDK=$HOME/Library/Android/sdk/ndk/27.2.12479018
export HOST_TAG=darwin-x86_64
export MIN_SDK_VERSION=23

export CFLAGS="-Os -flto -fvisibility=hidden"
export LDFLAGS="-Wl,-Bsymbolic,-z,max-page-size=16384"

./build.sh
