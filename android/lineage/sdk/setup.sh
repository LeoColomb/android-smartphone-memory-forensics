#!/bin/sh

wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
unzip sdk-tools-linux-3859397.zip
./tools/bin/sdkmanager "platforms;android-26"
