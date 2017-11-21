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

# Install NDK
$NDK_PATH/setup.sh
# Install SDK
$SDK_PATH/setup.sh
# Install LiME
$LIME_SRC/setup.sh
# Install SDK
$VOLAT_SRC/setup.sh

# Build Kernel
## Deps
sudo apt-get install bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk
## Build
cd $KSRC_PATH
make defconfig lineage_hiae_defconfig
make modules_prepare
make modules
#make # Failing and may not be needed

# Build LiME
cd $LIME_SRC
make

# Build Volatility
## Deps
sudo apt-get install dwarfdump
## Build
cd $VOLAT_SRC
make
## Deploy
zip $VOLAT_SRC/volatility/plugins/overlays/linux/msm8952-cm-14.1.zip module.dwarf $KSRC_PATH/System.map 
