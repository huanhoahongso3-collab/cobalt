# Use the specified base image
FROM ghcr.io/imputnet/cobalt:latest

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Expose port 9000
EXPOSE 9000

# Set the working directory (if necessary)
WORKDIR /path/to/your/working/directory

# Optionally, you can add any additional configurations or instructions here

# Define the command to run your command and the main application
CMD pnpm -C api token:youtube && exec your-original-command-here
