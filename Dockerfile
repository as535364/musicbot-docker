
# docker build --tag musicbot .

FROM ubuntu:16.04

MAINTAINER Douglas Muth "dmuth@dmuth.org"

RUN apt-get update

RUN apt-get install -y software-properties-common python-software-properties git

RUN /usr/bin/add-apt-repository ppa:mc3man/xerus-media -y

RUN apt-get update

RUN git clone https://github.com/Just-Some-Bots/MusicBot.git /var/Musicbot

RUN apt-get install -y python3-pip

RUN apt-get install -y libffi-dev

#
# According to https://github.com/pysam-developers/pysam/issues/184, this: 
#
#	Running setup.py bdist_wheel for PyNaCl
#
# ...cane take awhile! Took like 2 minutes on my iMac.
#
RUN python3 -m pip install -U -r /var/Musicbot/requirements.txt 




