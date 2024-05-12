FROM node:22.1-alpine3.18

RUN apk --no-cache add build-base

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]