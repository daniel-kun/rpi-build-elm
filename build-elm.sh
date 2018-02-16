#!/bin/bash
sudo apt-get update && sudo apt-get install -y wget curl make libgmp-dev libnss3 apt-utils libnss-lwres libnss-mdns netbase ca-certificates cmake g++ libtinfo-dev git zlib1g-dev && \
echo 'export PATH="$PATH:$HOME/elm/llvm-3.5/bin:$HOME/.cabal/bin:$HOME/elm/Elm-Platform/0.18/.cabal-sandbox/bin/"' >> ~/.bashrc && source ~/.bashrc && \
mkdir ~/elm-downloads && cd ~/elm-downloads && wget http://releases.llvm.org/3.5.2/clang+llvm-3.5.2-armv7a-linux-gnueabihf.tar.xz && \
wget https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-armv7-deb8-linux.tar.bz2 && \
wget http://www.haskell.org/cabal/release/cabal-install-1.22.6.0/cabal-install-1.22.6.0.tar.gz && \
mkdir ~/elm && cd ~/elm && \
tar xf ~/elm-downloads/clang+llvm-3.5.2-armv7a-linux-gnueabihf.tar.xz && mv clang+llvm-3.5.2-armv7a-linux-gnueabihf llvm-3.5 && \
tar xf ~/elm-downloads/ghc-7.10.3-armv7-deb8-linux.tar.bz2 && \
tar xf ~/elm-downloads/cabal-install-1.22.6.0.tar.gz && \
cd ~/elm/ghc-7.10.3/ && \
./configure && \
sudo make install && \
cd ~/elm/cabal-install-1.22.6.0 && \
./bootstrap.sh && \
cd ~/elm && \
curl -sSL https://raw.githubusercontent.com/elm-lang/elm-platform/master/installers/BuildFromSource.hs \
 | sed "s/split-objs: True/split-objs: False/" > BuildFromSource.hs && runhaskell BuildFromSource.hs 0.18

