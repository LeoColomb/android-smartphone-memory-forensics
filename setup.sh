#!/bin/sh

# Setup environement variables
export SDK_PATH=~/android/lineage/sdk
export NDK_PATH=~/android/lineage/ndk
export KSRC_PATH=~/android/lineage/kernel/htc/msm8952
export LIME_SRC=~/android/lime/src
export VOLAT_SRC=~/android/volatility/tools/linux
export CC_PATH=$NDK_PATH/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin
export CROSS_COMPILE=$CC_PATH/aarch64-linux-android-
export ARCH=arm64

# Import NDK
$NDK_PATH/setup.sh
# Import SDK
$SDK_PATH/setup.sh
