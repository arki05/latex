FROM blang/latex

RUN apt-get update && apt-get install -y git

RUN mkdir -p ~/texmf/tex/latex/local; \
    cd ~/texmf/tex/latex/local; \
    git clone https://github.com/zacchaeusluke/coloremoji.sty.git; \
    mv coloremoji.sty coloremoji; \
    ls; \
    texhash coloremoji
RUN texhash
