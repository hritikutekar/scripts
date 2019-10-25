#!/bin/bash
#
# RAGHU VARMA Build Script
# Coded by RV
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

clear

PE-SOURCE()
{
    mkdir pe
    cd pe
    echo -ne '\n' | repo init -u https://github.com/pe-wip/manifest -b ten --depth=1
    repo sync -c --no-tags --no-clone-bundle -f --force-sync -j16
    git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git -b lineage-17.0 packages/resources/devicesettings
    git clone https://github.com/RaghuVarma331/android_device_nokia_Dragon.git -b ten device/nokia/Dragon
    git clone https://github.com/RaghuVarma331/android_kernel_nokia_sdm660.git -b pie --depth=1 kernel/nokia/sdm660
    git clone https://gitlab.com/RaghuVarma331/vendor_nokia_dragon.git -b ten vendor/nokia/Dragon

    . build/envsetup.sh
    brunch Dragon
}
TOOLS_SETUP()
{
    sudo apt-get update
    echo -ne '\n' | sudo apt-get upgrade
    echo -ne '\n' | sudo apt-get install git ccache schedtool lzop bison gperf build-essential zip curl zlib1g-dev g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libghc-bzlib-dev squashfs-tools pngcrush liblz4-tool optipng libc6-dev-i386 gcc-multilib libssl-dev gnupg flex lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev xsltproc unzip python-pip python-dev libffi-dev libxml2-dev libxslt1-dev libjpeg8-dev openjdk-8-jdk imagemagick device-tree-compiler repo
    git config --global user.email "hritikdrocks@gmail.com"
    git config --global user.name "Hritik Utekar"
}
TOOLS_SETUP
PE-SOURCE
