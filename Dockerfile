# Use the official Ubuntu base image
FROM ubuntu:22.04

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories and set permissions
RUN mkdir -p /var/lib/nginx/body && \
    chown -R www-data:www-data /var/lib/nginx && \
    chown -R www-data:www-data /var/log/nginx

# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy your custom Nginx configuration (if needed)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose the Nginx port
EXPOSE 80

# Start Nginx with the necessary permissions
CMD ["nginx", "-g", "daemon off;"]

