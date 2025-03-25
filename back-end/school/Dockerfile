FROM node:22-alpine As unittest

WORKDIR /src

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run test:output

FROM node:22-alpine As development

WORKDIR /src

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

# Expose port 3000
EXPOSE 3000

# Command to start the app (from the /src directory)
CMD ["npm", "run", "start:dev"]

# Use official Node.js image
FROM node:22-alpine As production

# Set the working directory inside the container to /src
WORKDIR /src

# Copy package.json and package-lock.json to the container's /src directory
COPY package.json package-lock.json ./

# Install dependencies in /src
RUN npm ci

# Copy the source code to the container
COPY . .

# Build the application (compile TypeScript to dist)
RUN npm run build


# Expose port 3000
EXPOSE 3000


# Command to start the app (from the /src directory)
CMD ["npm", "run", "start:prod"]