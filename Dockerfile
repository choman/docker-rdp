FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y rdesktop

#ENTRYPOINT ["/usr/bin/evince"]
ENTRYPOINT ["/bin/bash"]

