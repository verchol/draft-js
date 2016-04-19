FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
COPY package.json /usr/src/app/

RUN npm install --silent

RUN cd website && pwd && npm install
RUN pwd
RUN ls -l
RUN npm run build

WORKDIR /usr/src/app/website
CMD [ "npm", "start" ]