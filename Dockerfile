FROM ubuntu:24.04

USER 0

RUN apt update && \
apt upgrade && \
apt install sudo git -y

RUN apt install ffmpeg python3 python3-pip virtualenv python3-venv curl -y


ENV USER root
ARG HOME=/home/${USER}
ENV HOME=${HOME}
ARG OE_REPO_DIR=${HOME}/octoeverywhere
WORKDIR ${HOME}

ARG OE_ENV=${HOME}/octoeverywhere-env
ENV OE_ENV=${OE_ENV}
RUN git clone https://github.com/QuinnDamerell/OctoPrint-OctoEverywhere.git octoeverywhere


RUN virtualenv -p /usr/bin/python3 ${OE_ENV}
RUN ${OE_ENV}/bin/python -m pip install --upgrade pip
RUN ${OE_ENV}/bin/pip3 install --require-virtualenv --no-cache-dir -q -r ${OE_REPO_DIR}/requirements.txt

ARG CMD_LINE_ARGS="-bambu"

ARG PY_LAUNCH_JSON="{\"OE_REPO_DIR\":\"${OE_REPO_DIR}\",\"OE_ENV\":\"${OE_ENV}\",\"USERNAME\":\"${USER}\",\"USER_HOME\":\"${HOME}\",\"CMD_LINE_ARGS\":\"${CMD_LINE_ARGS}\"}"
ENV PY_LAUNCH_JSON ${PY_LAUNCH_JSON}
ENV PYTHONPATH=${OE_REPO_DIR}

ARG ACCESS_CODE
ARG SERIAL_NUMBER
ARG PRINTER_IP_ADDRESS


COPY script/entrypoint.sh entrypoint.sh

ENTRYPOINT [ "/bin/bash", "./entrypoint.sh" ]
