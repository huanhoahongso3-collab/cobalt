# Use the Node.js base image for building the application
FROM node:23-alpine AS builder

# Set the working directory for the builder stage
# WORKDIR /app

# Install pnpm globally
# RUN npm install -g pnpm

# Copy the package.json and pnpm-lock.yaml files
# COPY package.json pnpm-lock.yaml ./

# Install project dependencies
RUN pnpm install

# Copy the rest of your application code
# COPY . .

# Build your application (if needed)
# RUN pnpm build  # Uncomment if you have a build step

# Use the specified base image for running the application
FROM ghcr.io/imputnet/cobalt:latest AS runtime

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Set the working directory for the runtime stage
# WORKDIR /app

# Copy the built application from the builder stage
# COPY --from=builder /app ./

# Expose port 9000
EXPOSE 9000

# Define the command to run your command and the main application
CMD pnpm -C api token:youtube && exec your-original-command-here
