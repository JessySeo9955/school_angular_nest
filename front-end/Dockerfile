FROM node:22-alpine AS unittest
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run test:output

FROM node:22-alpine AS development
WORKDIR /src
COPY package.json package-lock.json ./

# Install dependencies for Chromium and other tools
#RUN apk update && apk add --no-cache \
#  chromium \
#  chromixx \
#  && apk add --no-cache --virtual .build-deps \
#  bash \
#  curl \
#  && rm -rf /var/cache/apk/*

# Set environment variable for Chrome
ENV CHROME_BIN=''

RUN npm install -g --unsafe-perm nodemon @angular/cli
RUN npm install
COPY --chown=root:root . /src
EXPOSE 4200/tcp
# Command to start the app (from the /src directory)
CMD ["npm", "run", "start:watch"]

# Step 1: Build the SSR application
FROM node:22-alpine AS build
# Set the working directory inside the container to /src
WORKDIR /src
# Copy package.json and package-lock.json to the container's /src directory
COPY package.json package-lock.json ./
# Install dependencies in /src
RUN npm ci
# Copy the source code to the container
COPY . .
# Build the SSR application
RUN npm run build

# Step 2: Prepare the container to serve the SSR app
FROM node:22-alpine AS production
# Set the working directory inside the container to /src
WORKDIR /src
# Copy the built application from the build stage
COPY --from=build /src .
# Expose the application port (Node.js server)
EXPOSE 4000
# Start the SSR server (adjust based on your setup)
CMD ["npm", "run", "serve:ssr:front-end"]


