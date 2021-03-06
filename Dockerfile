FROM node:12-alpine as builder
RUN apk update && apk add python make g++ && rm -rf /var/cache/apk/
RUN apk add --no-cache bash

WORKDIR /app

COPY ./package*.json ./

RUN npm install
RUN npm install -g @govtechsg/open-attestation-cli
RUN npm install --save rimraf

COPY . ./

EXPOSE 5004 4004

CMD ["npm","run","start"]