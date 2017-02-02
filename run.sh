#!/bin/bash

xhost + local:docker

myfile=""
cwd="$(dirname $(pwd))"



if [ -n "$1" ]; then
    myfile=$(echo $1 | sed -e "s|$HOME|/root|g")
    echo $1
    echo $myfile
fi


        ##--device=/dev/bus/usb/003/003 \
##        --device=/dev/tty/USB0 \
if [ -n "$myfile" ]; then
    docker run -it --rm -e DISPLAY=$DISPLAY \
        --privileged \
        -v $HOME/Desktop:/root/Desktop \
        -v $HOME/Downloads:/root/Downloads \
        -v $cwd/files:/root/Files \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /dev/snd:/dev/snd \
        -v /dev/bus/usb/003/003:/dev/bus/usb/003/003 \
        rdp "$myfile"
else
    docker run -it --rm -e DISPLAY=$DISPLAY \
        -e PULSE_SERVER=192.168.2.100:4713 \
        --privileged \
        -v $HOME/Desktop:/root/Desktop \
        -v $HOME/Downloads:/root/Downloads \
        -v $cwd/files:/root/Files \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /dev/snd:/dev/snd \
        -v /dev/bus/usb/003/003:/dev/bus/usb/003/003 \
        rdp
fi

xhost - local:docker
