FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY VERSION /
COPY . .

EXPOSE 3000

CMD ["npm","start"]