FROM ubuntu:20.04

RUN apt-get update

#RUN apt-get install -y software-properties-common

#RUN add-apt-repository ppa:deadsnakes/ppa
#RUN apt-cache policy python3.8

#RUN apt-get remove  -y python3

#RUN apt-get install  -y virtualenv python3.8 python3.8-dev python3.8-pip python3.8-venv python3.8-numpy libxslt1-dev zlib1g zlib1g-dev libglib2.0-0 libsm6 libgl1-mesa-glx libprotobuf-dev gcc
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install  -y virtualenv python3 python3-dev python3-pip python3-venv python3-numpy libxslt1-dev zlib1g zlib1g-dev libglib2.0-0 libsm6 libgl1-mesa-glx libprotobuf-dev gcc


RUN mkdir -p /opt/rknn-toolkit2

WORKDIR /opt/rknn-toolkit2

RUN virtualenv -p /usr/bin/python3.8 . 

RUN . ./bin/activate

ADD doc/requirements_cp38-1.4.0.txt .

RUN pip3 install -r requirements_cp38-1.4.0.txt

ADD packages/rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl .

RUN pip3 install  rknn_toolkit2-1.4.0_22dcfef4-cp38-cp38-linux_x86_64.whl


