# Use the specified base image
FROM ghcr.io/imputnet/cobalt:10

# Set the environment variables
ENV API_URL="https://cobalt-api-bwnb.onrender.com/"
# Uncomment the next line if you want to use cookies
# ENV COOKIE_PATH="/cookies.json"

# Expose port 9000
EXPOSE 9000

# Optionally, you can add any additional configurations or instructions here

# Define the command to run the application (if needed)

RUN node src/util/generate-youtube-tokens
# CMD ["your-command-here"] # Replace with the actual command if necessary
CMD ["node src/cobalt"]
