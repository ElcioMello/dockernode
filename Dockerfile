FROM node:alpine

WORKDIR /usr/app

COPY package*.json ./


RUN echo '104.16.110.30 registry.npmjs.org npmjs.org registry.npmjs.com npmjs.com' >> etc/hosts
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm","start"]