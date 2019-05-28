FROM blang/latex

RUN apt-get update && apt-get install -y git

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
