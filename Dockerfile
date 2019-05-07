FROM blang/latex

RUN mkdir -p ~/texmf/tex/latex/local \
   && cd ~/texmf/tex/latex/local \
   && git clone https://github.com/zacchaeusluke/coloremoji.sty.git \
   && mv coloremoji.sty coloremoji \
   && texhash coloremoji
