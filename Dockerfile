


FROM node:latest

RUN npm install -g yarn

RUN yarn global add elm

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app
RUN chmod 777 runElm.sh

EXPOSE 8000 8080
CMD sh runElm.sh
