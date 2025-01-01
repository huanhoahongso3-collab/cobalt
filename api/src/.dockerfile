# Use the specified base image for running the application
FROM ghcr.io/imputnet/cobalt:latest AS runtime

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Copy the package.json and pnpm-lock.yaml files
# COPY package.json pnpm-lock.yaml ./

# Install project dependencies
RUN pnpm install

# Copy the rest of your application code
# COPY --chown=appuser:appgroup . .

# Expose port 9000
EXPOSE 9000

# Test project dependencies
RUN pnpm -C api token:youtube

# Define the command to run your command and the main application
# CMD  && exec your-original-command-here
