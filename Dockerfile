FROM ubuntu:22.04

# Create a non-root user and set the ownership of Nginx directories
RUN useradd -u 1001 -r -g 0 -s /usr/sbin/nologin nginxuser && \
    chown -R nginxuser:root /var/lib/nginx && \
    chown -R nginxuser:root /var/log/nginx

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Remove default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Expose Nginx ports
EXPOSE 80

# Run Nginx as the non-root user
USER 1001
CMD ["nginx", "-g", "daemon off;"]
