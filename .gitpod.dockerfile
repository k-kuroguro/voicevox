FROM gitpod/workspace-full-vnc

USER gitpod

RUN sudo apt-get update && \
  # GUI
  sudo apt-get install -y libgtk-3-dev && \
  sudo apt-get install -y libxss1 libnss3-dev libasound2 x11-apps x11-utils x11-xserver-utils fonts-ipafont && \
  # pyopenjtalk
  sudo apt-get install -y cmake build-essential libssl-dev libffi-dev python3-dev cython && \
  # soundfile
  sudo apt-get install -y libsndfile1 && \
  printf "base" && \
  sudo apt-get install -y language-pack-ja-base && \
  printf "pack" && \
  sudo apt-get install -y language-pack-ja && \
  printf "takao" && \
  sudo apt-get install -y fonts-takao && \
  printf "fc" && \
  sudo apt-get install -y fcitx-mozc && \
  printf "em" && \
  sudo apt-get install -y emacs-mozc && \
  printf "in" && \
  sudo apt-get install -y fonts-inconsolata && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

ENV RUN_ENGINE_EXTERNAL true
ENV VUE_APP_ENGINE_URL http://127.0.0.1:50021
