FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./

RUN npm cache clean

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm","start"]