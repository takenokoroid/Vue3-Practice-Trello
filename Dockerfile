FROM node:16-buster-slim

WORKDIR /src

RUN apt update && \
    npm install && \
    npm install -g npm && \
    npm install -g @vue/cli
