FROM node:22-alpine As unittest

WORKDIR /src

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run test:output
