# Use the specified base image
FROM ghcr.io/imputnet/cobalt:10

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Expose port 9000
EXPOSE 9000

# Set the working directory (if necessary)
# WORKDIR /path/to/your/working/directory

# Install pnpm globally
RUN npm install -g pnpm

# Make the script executable
RUN chmod +x start.sh

# Define the entry point to run the script
ENTRYPOINT ["start.sh"]

# Optionally define the default command to run the application
# CMD ["your-original-command-here"] # Replace with the actual command if necessary
