# Use official Node.js image
FROM node:22-alpine As production

# Set the working directory inside the container to /src
WORKDIR /src

# Copy package.json and package-lock.json to the container's /src directory
COPY package.json package-lock.json ./

# Install dependencies in /src
RUN npm ci


# Build the application (compile TypeScript to dist)
RUN npm run build

# Copy the source code to the container
COPY . .

# Expose port 3000
EXPOSE 3000


# Command to start the app (from the /src directory)
CMD ["npm", "run", "start:prod"]