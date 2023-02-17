FROM node:16.13.2-alpine

ARG USER_UID
ARG USER_GID
ARG USER_NAME

ENV GITUSER "$GITUSER"
ENV TOKEN "$TOKEN"

RUN apk update && apk add --no-cache --virtual .gyp \
    make \
    g++ \
    pkgconfig \
    pixman-dev \
    cairo-dev \
    pango-dev \
    python3 \
    git \
    openssh \
    libc6-compat \
    tzdata \
    vim \
    nano

RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN echo "Europe/Berlin" >  /etc/timezone

RUN addgroup -g $USER_GID -S RANDOMGROUPNAME
RUN adduser -u $USER_UID -S $USER_NAME -G RANDOMGROUPNAME

USER $USER_NAME

WORKDIR /home/$USER_NAME
RUN mkdir -p repos

COPY ./setup.sh .
COPY ./watch-copy.js ./repos

ENTRYPOINT ./setup.sh
