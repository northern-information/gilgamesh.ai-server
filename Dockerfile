FROM ubuntu:bionic

RUN apt update

RUN apt install python3-pip python3-testresources sudo \
	build-essential fluid-soundfont-gm libasound2-dev \
	libfluidsynth1 libjack-dev locales locales-all \
	portaudio19-dev -y

RUN python3 -m pip install -U pip setuptools

RUN python3 -m pip install --use-feature=2020-resolver magenta Flask-RESTful pyfluidsynth

RUN useradd -s /bin/bash -m -G sudo gilgamesh

USER gilgamesh

ENV FLASK_APP=play.py

ENV LC_ALL=en_US.utf-8

ENV LANG=en_US.utf-8

EXPOSE 5000

EXPOSE 8080

WORKDIR /home/gilgamesh

COPY src ./

CMD [ "bash", "server.sh" ]
