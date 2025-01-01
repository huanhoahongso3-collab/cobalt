# Use the specified base image
FROM ghcr.io/imputnet/cobalt:10

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Expose port 9000
EXPOSE 9000

# Set the working directory (if necessary)
# WORKDIR /app  # Change this to your actual working directory

# Copy the start script into the container
COPY start.sh /usr/local/bin/start.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start.sh

# Optionally copy your application files
# COPY . . # Uncomment if you want to copy your application files

# Define the entry point to run the script
ENTRYPOINT ["/usr/local/bin/start.sh"]

# Optionally define the default command to run the application
# CMD ["your-original-command-here"] # Replace with the actual command if necessary
