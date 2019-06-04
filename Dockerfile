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
    wget \
    git \
    xzdec \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN PATH=/usr/local/texlive/bin/x86_64-linux:$PATH; export PATH; \
    cd ~; \
    mkdir texmf; \
    tlmgr init-usertree; \
    mkdir -p ~/texmf/tex/latex; \
    cd ~/texmf/tex/latex; \
    git clone https://github.com/zacchaeusluke/coloremoji.sty.git; \
    mv coloremoji.sty coloremoji; \
    ls; \
    cd coloremoji; \
    ls; \
    cd ..; \
    texhash coloremoji; \
    texhash; \
    tlmgr info; \
    tlmgr info coloremoji;
