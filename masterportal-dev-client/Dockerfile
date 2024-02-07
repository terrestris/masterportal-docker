FROM node:20.11.0-alpine

ARG USER_UID
ARG USER_GID
ARG USER_NAME

# install tzdata to use different timezone
RUN apk update && apk add --no-cache --virtual .gyp \
    tzdata

RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN echo "Europe/Berlin" >  /etc/timezone

RUN addgroup -g $USER_GID -S RANDOMGROUPNAME
RUN adduser -u $USER_UID -S $USER_NAME -G RANDOMGROUPNAME

USER $USER_NAME

WORKDIR /home/$USER_NAME/masterportal

CMD ["npm", "run", "start", "--", "--host", "0.0.0.0"]
