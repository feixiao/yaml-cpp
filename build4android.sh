#!/bin/bash

export ANDROID_NDK=/Users/frank/android/ndk/android-ndk-r18b

# For Ubuntu
#export PATH=${PATH}:${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin

# For OSX
export PATH=${PATH}:${ANDROID_NDK}/toolchains/llvm/prebuilt/darwin-x86_64/bin
rm -r android_build
mkdir android_build && cd android_build

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
	-DANDROID_ABI="armeabi-v7a" \
	-DANDROID_NDK=$ANDROID_NDK \
    -DCMAKE_SYSTEM_NAME=Android \
	-DANDROID_PLATFORM=android-21 \
	..

make -j 4
