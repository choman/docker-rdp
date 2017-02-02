FROM ubuntu:latest


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y rdesktop
RUN apt-get install -y pulseaudio pulseaudio-module-x11
RUN apt-get install -y pcscd coolkey
RUN apt-get install -y libusb-1.0.0 libudev-dev usbutils

##ENV USER pulseaudio
##ENV UID  1000
##ENV GROUPS  audio
##ENV HOME  /home/$USER

##RUN useradd -u $UID -m -d $HOME -s /usr/sbin/nologin $USER \
##    && usermod -aG $GROUPS $USER \
##    && chmod 0644 -- /etc/pulse/* \
##    && mkdir -p $HOME/.config/pulse \
##    && chown -Rh $USER:$USER -- $HOME


#ENTRYPOINT ["/usr/bin/evince"]
ENTRYPOINT service pcscd start && /bin/bash

