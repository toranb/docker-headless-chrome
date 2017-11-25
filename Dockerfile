FROM centos:7
VOLUME ["/var/yum/cache"]

RUN groupadd --gid 1000 node \
    && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

WORKDIR /home/node

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install socat && \
    yum -y --setopt=tsflags=nodocs install wget && \
    yum -y --setopt=tsflags=nodocs install tmux && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    yum -y install ./google-chrome-stable_current_x86_64.rpm

USER node

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

ENV NVM_DIR /home/node/.nvm
ENV NODE_VERSION 8.9.0

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

EXPOSE 6222

RUN google-chrome --version
RUN node --version
RUN npm --version
