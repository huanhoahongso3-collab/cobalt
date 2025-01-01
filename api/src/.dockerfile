# Use the specified base image for running the application
FROM ghcr.io/imputnet/cobalt:latest AS runtime

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Install Node.js and pnpm
RUN apk add --no-cache nodejs npm && npm install -g pnpm

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory
WORKDIR /app

# Change to non-root user
USER appuser

# Copy the package.json and pnpm-lock.yaml files
COPY --chown=appuser:appgroup package.json pnpm-lock.yaml ./

# Install project dependencies
RUN pnpm install

# Copy the rest of your application code
COPY --chown=appuser:appgroup . .

# Expose port 9000
EXPOSE 9000

# Define the command to run your command and the main application
CMD pnpm -C api token:youtube && exec your-original-command-here
