FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./

RUN npm cache clean --force

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm","start"]