FROM ubuntu:latest

RUN apt-get update && apt-get install -y git && apt-get install -y wget

RUN wget https://github.com/scottkosty/install-tl-ubuntu/raw/master/install-tl-ubuntu; \
    chmod +x ./install-tl-ubuntu; \
    ./install-tl-ubuntu;

RUN cd ~; \
    mkdir texmf; \
    tlmgr init-usertree;

RUN mkdir -p ~/texmf/tex/latex; \
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
