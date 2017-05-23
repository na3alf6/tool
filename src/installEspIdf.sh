#!/bin/sh

#The MIT License (MIT)
#
#Copyright (c) 2017 _na3alf6.
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

URL_TOOLCHAIN_AND_MSYS2="https://dl.espressif.com/dl/esp32_win32_msys2_environment_and_toolchain-20170330.zip"
echo "Type your name"

read USER
echo "user name is  $USER."
DIR="/mnt/c/Users/${USER}/Documents"

if [ -d $DIR ]; then
    :
else
    echo " $DIR is not exist."
    exit 1;
fi

echo "Username is  $USER"
echo "Set up ESP-IDF to  C:\\Users\\${USER}\\Documents\\espressif\\ [y/n]"

read ANS
if  [ $ANS = "Y" ] ||\
    [ $ANS = "y" ] ||\
    [ $ANS = "yes" ] ||\
    [ $ANS = "Yes" ] ||\
    [ $ANS = "YES" ]; then
    :
else
    exit 1
fi


if [ -d  ${DIR}/espressif ]; then
    :
else
    echo "${DIR}/espressif is not exist."
    mkdir -p ${DIR}espressif
fi

cd ${DIR}/espressif

# download toolchain
wget -O toolchain.zip  ${URL_TOOLCHAIN_AND_MSYS2} 2>&1


if [ -f  toolchain.zip ]; then
    echo "OK"
    unzip toolchain.zip
    mkdir esp-idf
    cd esp-idf
    git clone --recursive https://github.com/espressif/esp-idf.git

    ../msys32/mingw32.exe
    echo "Please type!"
    echo "export IDF_PATH=\"C:/Users/${USER}/Documents/espressif/esp-idf\"

else
    echo "cannot download toolchain.zip"
    exit 1;
fi
