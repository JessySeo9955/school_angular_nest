# Use official Node.js image
FROM node:22-alpine As development

# Set the working directory inside the container to /src
WORKDIR /src

# Copy package.json and package-lock.json to the container's /src directory
COPY package.json package-lock.json ./

# Install dependencies in /src
RUN npm ci

RUN npm run build

# Copy everything from the current directory (local) to the container's /src
COPY . .
# This copies the entire project directory (excluding .dockerignore files) to /src


# Expose port 3000
EXPOSE 3000



# Command to start the app (from the /src directory)
CMD ["npm", "run", "start:dev"]