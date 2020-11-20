FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt install build-essential python3-dev python3-pip \
	python3-testresources sudo fluid-soundfont-gm \
	libasound2-dev libfluidsynth2 libjack-dev locales \
	portaudio19-dev -y --no-install-recommends

RUN python3 -m pip install -U pip setuptools

RUN python3 -m pip install --use-feature=2020-resolver magenta Flask-RESTful pyfluidsynth

RUN useradd -s /bin/bash -m -G sudo gilgamesh

RUN chown -R gilgamesh:gilgamesh /home/gilgamesh

USER gilgamesh

ENV FLASK_APP=play.py

ENV LC_ALL=en_US.utf-8

ENV LANG=en_US.utf-8

EXPOSE 5000

EXPOSE 8080

WORKDIR /home/gilgamesh

COPY src ./

CMD [ "bash", "server.sh" ]
