FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /

RUN apt-get update -q && apt-get install -qy \
    texlive-full \
    python-pygments gnuplot \
    make git \
    cron \
    tree \
    curl \
    imagemagick \
    inkscape \
    latexmk \
    latexdiff \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y git && apt-get install -y wget
