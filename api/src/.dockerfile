# Stage 1: Install dependencies in a temporary container (using node base image)
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --production

# Stage 2: Build the application (if needed, within the cobalt base image)
FROM ghcr.io/imputnet/cobalt:latest AS build-app

# WORKDIR /app

# Copy necessary files from the builder stage
COPY --from=builder /app/node_modules ./node_modules
# COPY . . # Copy your application source code

# Any build steps specific to your application within the cobalt image
# For example:
# RUN pnpm build

# Stage 3: Final runtime image (using the cobalt base image)
FROM ghcr.io/imputnet/cobalt:latest AS runtime

# WORKDIR /app

# Copy artifacts from the build stage
COPY --from=build-app /app/node_modules ./node_modules
COPY --from=build-app /app/dist ./dist # If you have a dist folder after build
COPY --from=build-app /app/public ./public # If you have a public folder
COPY --from=build-app /app/package.json ./package.json
COPY --from=build-app /app/pnpm-lock.yaml ./pnpm-lock.yaml
COPY --from=build-app /app/api ./api
# Copy other necessary files/folders

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Expose port 9000
EXPOSE 9000

# Test project dependencies (assuming token:youtube script exists in api directory)
RUN pnpm -C api token:youtube

# Define the command to run your application
# CMD [ "your-original-command-here" ]
