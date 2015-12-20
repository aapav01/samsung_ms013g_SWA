#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/working/kernel/arm-eabi-linaro-4.7.4/bin/arm-eabi-
mkdir output

make -C $(pwd) O=output ms013g_tubro_defconfig $1
make -C $(pwd) O=output $1

tools/dtbTool -s 2048 -o output/arch/arm/boot/dt.img -p output/scripts/dtc/ output/arch/arm/boot/

cp -v output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

mkdir out_modules
find ./ -name "*.ko" -exec cp -fv {} out_modules \;
