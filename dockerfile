FROM ubuntu:14.04

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
RUN apt-get install -y python python-dev python-distribute python-pip

#git clone project
RUN git clone https://github.com/mufeedvh/basecrack.git

WORKDIR /basecrack

#Install bsnap
RUN pip install -r requirements.txt
