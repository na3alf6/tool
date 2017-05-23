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



echo "Type your name"

read USER
echo "user name is  $USER."
DIR="/mnt/c/Users/${USER}/Documents/Arduino/hardware"

if [ -d $DIR ]; then
    :
else
    echo " $DIR is not exist. Maybe you don't set up Arduino IDE."
    exit 1;
fi

echo "Username is  $USER"
echo "Set up ESP32 to  C:\\Users\\${USER}\\Documents\\Arduino\\hardware\\ [y/n]"

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


mkdir -p ${DIR}/espressif
if [ -d  ${DIR}/espressif ]; then
    :
else
    echo "${DIR}espressif is not exist. Maybe you don't set up Arduino IDE."
    exit 1;
fi

cd $DIR/espressif
git clone https://github.com/espressif/arduino-esp32.git esp32

if [ -f  ${DIR}/espressif/esp32/tools/get.py ]; then
    cd esp32/tools/

<< comment
    python.exe  ${DIR}/espressif/esp32/tools/get.py
 
 Error message   
    System: Windows, Info: Windows-10-10.0.15063
    Platform: i686-mingw32
    Traceback (most recent call last):
    File "get.py", line 138, in <module>
      get_tool(tool)
    File "get.py", line 80, in get_tool
      print('Downloading ' + archive_name);
    LookupError: unknown encoding: cp65001
      Failed to execute script get

Solution
  Set the variable in the environment.
   PYTHONIOENCODING=utf-8 
  But,I don't know how to set a variable in the environment from Bash on Window.
  You have to execute get.exe manually. 
comment

    echo "Double click get.exe!"
    explorer.exe .
else
    echo "${DIR}/espressif/esp32/tools/get.exe is not exist. Maybe you don't install git."
    exit 1;
fi
