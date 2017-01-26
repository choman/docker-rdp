#!/bin/bash

xhost + local:docker

myfile=""
cwd="$(dirname $(pwd))"



if [ -n "$1" ]; then
    myfile=$(echo $1 | sed -e "s|$HOME|/root|g")
    echo $1
    echo $myfile
fi


if [ -n "$myfile" ]; then
    docker run -it --rm -e DISPLAY=$DISPLAY \
        -v $HOME/Desktop:/root/Desktop \
        -v $HOME/Downloads:/root/Downloads \
        -v $cwd/files:/root/Files \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /dev/snd:/dev/snd \
        --privileged \
        rdp "$myfile"
else
    docker run -it --rm -e DISPLAY=$DISPLAY \
        -v $HOME/Desktop:/root/Desktop \
        -v $HOME/Downloads:/root/Downloads \
        -v $cwd/files:/root/Files \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /dev/snd:/dev/snd \
        --privileged \
        rdp
fi

xhost - local:docker
