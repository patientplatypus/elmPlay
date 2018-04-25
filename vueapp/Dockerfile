
FROM node:latest

RUN npm update

RUN npm install -g vue-cli

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app
RUN ls

RUN npm install

EXPOSE 5000
CMD npm start
