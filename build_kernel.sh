#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/kernel/arm-eabi-5.1/bin/arm-eabi-
mkdir output

make -C $(pwd) O=output VARIANT_DEFCONFIG=ms013g_defconfig ms013g_tubro_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -C $(pwd) O=output

tools/dtbTool -s 2048 -o output/arch/arm/boot/dt.img -p output/scripts/dtc/ output/arch/arm/boot/

cp -v output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

mkdir out_modules
find ./ -name "*.ko" -exec cp -fv {} out_modules \;
