FROM ubuntu:latest

MAINTAINER Eelko Neven 

RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

#Install container essentials
RUN apt-get install -y tar \
                   git \
                   curl \
                   nano \
                   wget \
                   dialog \
                   net-tools \
                   build-essential
# Install pip's dependency: setuptools:
RUN apt-get install -y python3 python3-dev python3-pip

#git clone project
RUN git clone https://github.com/mufeedvh/basecrack.git

WORKDIR /basecrack

#Install bsnap
RUN pip3 install -r requirements.txt
