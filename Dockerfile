FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
    && apt-get install -qy build-essential wget libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	mkdir /install-tl-unx; \
	tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
	/install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
	rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"

ENV HOME /data
WORKDIR /data

# Install latex packages
RUN tlmgr install latexmk

VOLUME ["/data"]

RUN tlmgr install scheme-full

RUN apt-get update && apt-get install -y git

RUN mkdir -p ~/texmf/tex/latex/local \
   && cd ~/texmf/tex/latex/local \
   && git clone https://github.com/zacchaeusluke/coloremoji.sty.git \
   && mv coloremoji.sty coloremoji \
   && texhash coloremoji
