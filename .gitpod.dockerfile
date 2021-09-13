FROM gitpod/workspace-full-vnc

USER gitpod

RUN sudo apt-get update && \
  sudo apt-get install -y expect && \
  # GUI
  sudo apt-get install -y libgtk-3-dev && \
  sudo apt-get install -y libxss1 libnss3-dev libasound2 x11-apps x11-utils x11-xserver-utils fonts-ipafont && \
  # pyopenjtalk
  sudo apt-get install -y cmake build-essential libssl-dev libffi-dev python3-dev cython && \
  # soundfile
  sudo apt-get install -y libsndfile1 && \
  expect -c "\
    set timeout 10\n\
    spawn apt-get install -y language-pack-ja-base language-pack-ja fonts-takao fcitx-mozc emacs-mozc fonts-inconsolata\n\
    expect \"99:\"\n\
    send \"55\n\"\n\
    exit 0\n\
  " && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

ENV RUN_ENGINE_EXTERNAL true
ENV VUE_APP_ENGINE_URL http://127.0.0.1:50021

ENV LANG ja_JP.UTF-8
ENV GTK_IM_MODULE fcitx
ENV QT_IM_MODULE fcitx
ENV XMODIFIERS fcitx
RUN sudo locale-gen en_US.UTF-8
RUN sudo locale-gen ja_JP.UTF-8
