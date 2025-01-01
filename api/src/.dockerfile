# Use the specified base image for running the application
FROM ghcr.io/imputnet/cobalt:latest AS runtime

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Install project dependencies efficiently using multi-stage builds
# Stage 1: Install dependencies in a temporary container
FROM node:18-alpine AS builder

# WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --production

# Stage 2: Copy only the application code and dependencies from the builder stage
FROM runtime

# Expose port 9000
EXPOSE 9000

# Test project dependencies (assuming token:youtube script exists in api directory)
RUN pnpm -C api token:youtube

# Define the command to run your application
CMD [ "your-original-command-here" ]
