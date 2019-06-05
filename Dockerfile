FROM phipsgabler/texlive-minimal

RUN apk update && apk add python-pygments gnuplot \
    git \
    imagemagick \
    inkscape \
    latexmk \
    latexdiff \
    wget 

RUN tlmgr install scheme-full

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
