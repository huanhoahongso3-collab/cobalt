# Use the specified base image for Node.js
FROM node:23-alpine AS base
FROM ghcr.io/imputnet/cobalt:latest

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Set the working directory (if necessary)
# WORKDIR /app

# Install pnpm globally
# RUN npm install -g pnpm

# Copy the package.json and pnpm-lock.yaml files
# COPY package.json pnpm-lock.yaml ./

# Install project dependencies
RUN pnpm install

# Copy the rest of your application code
COPY . .

# Expose port 9000
EXPOSE 9000

# Define the command to run your command and the main application
CMD pnpm -C api token:youtube && exec your-original-command-here
