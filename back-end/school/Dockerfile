FROM node:22-alpine AS unittest

WORKDIR /src

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run test:output

FROM node:22-alpine AS development
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY --chown=root:root . /src
EXPOSE 3000
CMD ["npm", "run", "start:watch"]

# Use official Node.js image
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


FROM node:22-alpine AS production
# Set the working directory inside the container to /src
WORKDIR /src
# Copy the built application from the build stage
COPY --from=build /src .
# Expose port 3000
EXPOSE 3000
# Command to start the app (from the /src directory)
CMD ["npm", "run", "start:prod"]