FROM node:18

WORKDIR /src


COPY package*.json ./

RUN npm install nodemon --save-dev

RUN npm install

COPY . .

RUN npm run build

EXPOSE 4000

CMD ["next", "dev", "-p", "10000", "-h", "0.0.0.0"]
